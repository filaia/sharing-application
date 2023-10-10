//
//  FeedViewController.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import UIKit

final class FeedViewController: UIViewController {
        
    private let feedViewModel: FeedViewModel
    
    init(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // TODO: - Dynamic height
    private lazy var feedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // TODO: - refactor
        layout.itemSize = CGSize(width: self.view.frame.width, height: view.frame.height / 2)
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: Identifiers.feedCellId)
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        feedViewModel.fetchTestData()
        self.title = "Instagram"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        dismissKeyboardTouchOutside()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(feedCollectionView)
        feedCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
        }
    }
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        feedViewModel.feedCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.feedCellId, for: indexPath) as? FeedCollectionViewCell else {
            return UICollectionViewCell()
        }
        let feedModel = feedViewModel.feedModel[indexPath.row]
        cell.configure(with: feedModel)
        return cell
    }
}

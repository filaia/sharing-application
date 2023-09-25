//
//  FeedViewController.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import UIKit

final class FeedViewController: UIViewController {
    
    let feedViewModel: FeedViewModel
    
    init(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private let signOutButton = UIButton(configuration: .tinted(), primaryAction: UIAction(title: "Sign out", handler: { _ in
        print("sign out")
    }))
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        dismissKeyboardTouchOutside()
        
        getData()
    }
    
    func getData() {
        DispatchQueue.main.async {
            self.textLabel.text = self.feedViewModel.getEmail()
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(signOutButton)
        signOutButton.tintColor = UIColor.systemRed
        signOutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
    }
}

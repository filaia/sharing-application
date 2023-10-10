//
//  FeedCollectionViewCell.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 03.10.2023.
//

import UIKit

final class FeedCollectionViewCell: UICollectionViewCell {
        
    private let profileImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.contentMode = .scaleAspectFill
        stackView.axis = .horizontal
        stackView.addArrangedSubview(profileImageView)
        stackView.addArrangedSubview(usernameLabel)
        return stackView
    }()
        
    private var postImageView: ScaledHeightImageView = {
        let image = ScaledHeightImageView()
        image.contentMode  = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private var likeButton = UIButton(configuration: .tinted(), primaryAction: UIAction(image: UIImage(systemName: "heart"), handler: { _ in
        print("like")
    }))
    
    private var commentButton = UIButton(configuration: .tinted(), primaryAction: UIAction(image: UIImage(systemName: "bubble.right"), handler: { _ in
        print("comment")
    }))
    
    private var saveButton = UIButton(configuration: .tinted(), primaryAction: UIAction(image: UIImage(systemName: "bookmark"), handler: { _ in
        print("save")
    }))
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(commentButton)
        stackView.addArrangedSubview(saveButton)
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    
    private var likesCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private let dateCreatedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with feedModel: FeedModel) {
        self.profileImageView.image = UIImage(named: "photographer")!
        self.usernameLabel.text = "@filaia"
        self.dateCreatedLabel.text = "\(Date.now)"
        self.postImageView.image = UIImage(named: "beach")!
        self.postImageView.image = feedModel.photo
        self.likesCountLabel.text = "Liked by \(feedModel.likesCount) people"
    }
    
    private func setupViews() {
        contentView.addSubview(headerStackView)
        profileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(44)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.top.leading.equalTo(16)
            make.height.equalTo(44)
        }
        
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        contentView.addSubview(buttonsStackView)
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom)
            make.leading.equalTo(contentView.snp.leadingMargin)
            //            make.height.equalTo(50)
        }
        
        contentView.addSubview(likesCountLabel)
        likesCountLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonsStackView.snp.bottom)
            make.leading.equalTo(contentView.snp.leadingMargin)
        }
        
        contentView.addSubview(dateCreatedLabel)
        dateCreatedLabel.snp.makeConstraints { make in
            make.top.equalTo(likesCountLabel.snp.bottom)
            make.leading.equalTo(contentView.snp.leadingMargin)
            make.bottom.equalToSuperview()
        }
    }
}

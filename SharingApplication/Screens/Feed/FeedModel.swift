//
//  FeedModel.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 03.10.2023.
//

import Foundation
import UIKit

struct FeedModel {
    let photo: UIImage
    let likesCount: Int
    let commentsCount: Int
}

extension FeedModel {
    static func getTestData() async -> [FeedModel] {
        return [
            FeedModel(photo: UIImage(named: "beach")!, likesCount: 0, commentsCount: 0),
            FeedModel(photo: UIImage(named: "man")!, likesCount: 12345, commentsCount: 32),
            FeedModel(photo: UIImage(named: "photographer")!, likesCount: 435, commentsCount: 243),
            FeedModel(photo: UIImage(named: "sea")!, likesCount: 12, commentsCount: 2),
            FeedModel(photo: UIImage(named: "vertical-photo")!, likesCount: 1234567, commentsCount: 999),
        ]
    }
}

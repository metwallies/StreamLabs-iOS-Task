//
//  Comment.swift
//  StreamLabs
//
//  Created by islam metwally on 5/15/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

struct Comment {
    var username: String = ""
    var userComment: String = ""
    var likeComment: NSAttributedString?
    var isLike: Bool = false
    var likeCount: Int? {
        didSet {
            if self.isLike == true {
                let basicLikeComment = String(format:"Just liked this %i times", self.likeCount!)
                likeComment = basicLikeComment.colorRange(of: "\(likeCount!)", color: .darkOrange, in: basicLikeComment)
            }
        }
    }
    
    init(username: String, userComment: String, isLike: Bool = false, likeCount: Int? = 0) {
        self.username = username
        self.userComment = userComment
        self.isLike = isLike
        self.likeCount = likeCount
    }
}

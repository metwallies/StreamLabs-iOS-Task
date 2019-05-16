//
//  CommentTableViewCell.swift
//  StreamLabs
//
//  Created by islam metwally on 5/15/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var userCommentLabel: UILabel!
    
    var comment: Comment! {
        didSet {
            self.configureCell()
        }
    }
    
    private func configureCell() {
        self.usernameLabel.text = self.comment.username
        self.userCommentLabel.text = self.comment.userComment
        if comment.isLike {
            self.userCommentLabel.attributedText = comment.likeComment
        }
    }
}

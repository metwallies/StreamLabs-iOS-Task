//
//  UsersCollectionViewCell.swift
//  StreamLabs
//
//  Created by islam metwally on 5/15/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

class UsersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var borderView: UIView!
    @IBOutlet private weak var notificationView: UIView!
    @IBOutlet private weak var contestImage: UIImageView!
    @IBOutlet private weak var notificationLabel: UILabel!
    
    var user: User! {
        didSet {
            self.configureCell()
        }
    }
    
    private func configureCell() {
        self.userImageView.image = self.user.userImage
        self.usernameLabel.text = self.user.username
        
        if user.isSelected {
            self.borderView.backgroundColor = .white
            self.usernameLabel.textColor = .white
        } else {
            self.usernameLabel.textColor = UIColor.lightGray
        }
        
        if user.isContest {
            self.contestImage.image = UIImage(named: "small star")?.tinted(with: .white)
            self.notificationLabel.text = ""
            self.notificationView.backgroundColor = .black
        } else if user.isOnline {
            self.contestImage.image = UIImage()
            self.notificationLabel.text = "\(self.user.numberOfNotifications)"
            self.notificationView.backgroundColor = .red
            self.borderView.addGradient(withColor: .darkOrange, color2: UIColor.violet)
        } else if user.isFeed {
            self.contestImage.image = UIImage()
            self.notificationLabel.text = ""
            self.notificationView.backgroundColor = .clear
            self.borderView.addGradient(withColor: .darkOrange, color2: UIColor.violet)
        } else {
            self.contestImage.image = UIImage()
            self.notificationLabel.text = ""
            self.notificationView.backgroundColor = .clear
            self.borderView.backgroundColor = UIColor.darkGray
        }
    }
}

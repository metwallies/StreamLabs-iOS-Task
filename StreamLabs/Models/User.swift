//
//  User.swift
//  StreamLabs
//
//  Created by islam metwally on 5/15/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

struct User {
    var username: String = ""
    var userImage: UIImage = UIImage()
    var isOnline: Bool = false
    var isContest: Bool = false
    var isFeed: Bool = false
    var numberOfNotifications: Int = 0
    var isSelected: Bool = false
    
    init(username: String, userImage: UIImage, isOnline: Bool = false, isContest: Bool = false, numberOfNotifications: Int = 0, isSelected: Bool = false) {
        self.username = username
        self.userImage = userImage
        self.isOnline = isOnline
        self.isContest = isContest
        self.numberOfNotifications = numberOfNotifications
        self.isSelected = isSelected
    }
}

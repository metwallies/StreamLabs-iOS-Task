//
//  DashboardPresenter.swift
//  StreamLabs
//
//  Created by islam metwally on 5/15/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

protocol DashboardPresenterProtocol {
    var view: DashboardViewProtocol? { get set }
    func numberOfRows(inSection section: Int) -> Int
    func commentFor(indexPath: IndexPath) -> Comment
    func didSelectComment(atIndexPath indexPath: IndexPath)
    func numberOfItems(inSection section: Int) -> Int
    func userFor(indexPath: IndexPath) -> User
    func didSelectUser(atIndexPath indexPath: IndexPath)
    func didFavorite()
    func getFavoriteCount() -> String
    func getFavoriteColor() -> UIColor
}

class DashboardPresenter: DashboardPresenterProtocol {
    
    var commentsArray: [Comment] = []
    var usersArray: [User] = []
    var favoriteCount: Int = 0
    weak var view: DashboardViewProtocol?
    
    init() {
        self.commentsArray = self.createComments()
        self.usersArray = self.createUsers()
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func commentFor(indexPath: IndexPath) -> Comment {
        return commentsArray[indexPath.row]
    }
    
    func didSelectComment(atIndexPath indexPath: IndexPath) {
        print(commentsArray[indexPath.row].userComment)
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return usersArray.count
    }
    
    func userFor(indexPath: IndexPath) -> User {
        return usersArray[indexPath.row]
    }
    
    func didSelectUser(atIndexPath indexPath: IndexPath) {
        print(usersArray[indexPath.row].username)
    }
    
    func didFavorite() {
        favoriteCount += 1
    }
    
    func getFavoriteCount() -> String {
        if favoriteCount >= 1000 {
            return String(format: "%.1fk", (Double(favoriteCount)/1000.0))
        } else {
            return "\(favoriteCount)"
        }
    }
    
    func getFavoriteColor() -> UIColor {
        let colors: [UIColor] = [.red, .yellow, .darkOrange, .green, .blue, .lightGray]
        let random: Int = Int.random(in: 0 ..< colors.count)
        return colors[random]
    }
    
    func createComments() -> [Comment] {
        let usernames: [String] = ["drg5", "ninja", "yuierooo", "pikachU"]
        let userComments: [String] = ["", "🧙🏼‍♀️🧙🏼‍♀️🧙🏼‍♀️🧙🏼‍♀️", "how do you even do that? 🐙🐙", "im gonna try that!!"]
        var result: [Comment] = []
        for idx: Int in 0..<usernames.count {
            var comment: Comment = Comment(username: usernames[idx], userComment: userComments[idx])
            if idx == 0 {
                comment.isLike = true
                comment.likeCount = 100
            }
            result.append(comment)
        }
        return result
    }
    
    func createUsers() -> [User] {
        let usernames: [String] = ["Feed", "$1k Contest", "Ninja", "pokimane", "DrLupo", "Mestkawy"]
        let userImages: [UIImage] = [UIImage(color: .white)!, UIImage(color: .green)!, UIImage(color: .lightGray)!, UIImage(color: .blue)!, UIImage(color: .gray)!, UIImage(color: .orange)!]
        var result: [User] = []
        for idx: Int in 0..<usernames.count {
            var user = User(username: usernames[idx], userImage: userImages[idx])
            if idx == 1 {
                user.isContest = true
                user.isSelected = true
            } else if idx == 2 || idx == 3 {
                user.isOnline = true
                user.numberOfNotifications = 5
            } else if idx == 0 {
                user.isFeed = true
            }
            result.append(user)
        }
        return result
    }
}

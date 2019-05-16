//
//  TabBarViewController.swift
//  StreamLabs
//
//  Created by islam metwally on 5/14/19.
//  Copyright © 2019 Islam Metwally. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView() {
        self.tabBar.barTintColor = .darkBlue
        self.tabBar.isTranslucent = false
    }
}

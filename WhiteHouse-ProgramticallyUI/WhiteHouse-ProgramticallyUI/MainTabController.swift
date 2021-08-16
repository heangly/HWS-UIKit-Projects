//
//  MainTabController.swift
//  WhiteHouse-ProgramticallyUI
//
//  Created by Heang Ly on 8/15/21.
//

import UIKit

class MainTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        let recentNav = UINavigationController(rootViewController: ViewController())
        recentNav.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        let topRatedNav = UINavigationController(rootViewController: ViewController())
        topRatedNav.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 2)
        setViewControllers([recentNav, topRatedNav], animated: false)
    }
}

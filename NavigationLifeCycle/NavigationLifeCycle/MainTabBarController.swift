//
//  ViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//


import UIKit

 class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    func setupTabBar() {
       let feedViewController = createNavController(vc: FeedViewController(), itemName: "Foto", itemImage: "")
       let profileViewController = createNavController(vc: ProfileViewController(), itemName: "Lenta", itemImage: "")
       profileViewController.title = "Profile"
       viewControllers = [feedViewController, profileViewController]
    }
    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemName)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
}

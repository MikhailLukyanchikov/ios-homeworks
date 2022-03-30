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
       let feedViewController = createNavController(vc: FeedViewController(), itemName: "Feed", itemImage: "")
       let logInViewController = createNavController(vc: LogInViewController(), itemName: "Profile", itemImage: "")
     //  let infoView = createNavController(vc: InfoViewController(), itemName: "Inf", itemImage: "")
       viewControllers = [feedViewController, logInViewController]
        
    }
    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        _ = UITabBarItem(title: itemName, image: UIImage(systemName: itemName), tag: 0)
        //let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemName)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
       // item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
}

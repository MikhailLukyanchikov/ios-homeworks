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
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
        let logInViewController = createNavController(vc: LogInViewController(), itemName: "Profile", itemImage: "")
        logInViewController.tabBarItem.image = UIImage(systemName: "person")
        logInViewController.tabBarItem.title = "Profile"
        viewControllers = [feedViewController, logInViewController]
        
    }
    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let _ = UITabBarItem(title: itemName, image: UIImage(systemName: itemName), tag: 0)
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }

 }

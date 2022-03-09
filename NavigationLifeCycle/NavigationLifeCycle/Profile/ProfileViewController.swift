//
//  TasksViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//

import UIKit

 class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .brown
        
        let imageView = UIImageView(image: UIImage(named: "image")!)
        imageView.frame = CGRect(x: 10, y: 100, width: 200, height: 200)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        view.addSubview(imageView)
        let myField = UITextField(frame: CGRect(x: 250, y: 200, width: 120, height: 30))
        myField.backgroundColor = .green
        myField.layer.cornerRadius = 20
        myField.textAlignment = .center
        myField.text = "Nature"
        view.addSubview(myField)
    }
 }

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
        imageView.frame = CGRect(x: 16, y: 116, width: 150, height: 150)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        view.addSubview(imageView)
        let myField = UITextField(frame: CGRect(x: 220, y: 136, width: 120, height: 30))
        myField.backgroundColor = .green
        myField.layer.cornerRadius = 20
        myField.textAlignment = .center
        myField.text = "Nature"
        view.addSubview(myField)
    }
 }

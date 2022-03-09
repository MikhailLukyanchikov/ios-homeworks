//
//  TasksViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//

import UIKit

 class ProfileViewController: UIViewController {
    private let profileHeaderView: UIView = {
        let profileHearderView = ProfileHeaderView()
        profileHearderView.translatesAutoresizingMaskIntoConstraints = false
        profileHearderView.backgroundColor = .lightGray
        return profileHearderView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
        
//        let imageView = UIImageView(image: UIImage(named: "image")!)
//        imageView.frame = CGRect(x: 10, y: 100, width: 200, height: 200)
//        imageView.layer.masksToBounds = true
//        imageView.layer.cornerRadius = 50
//        view.addSubview(imageView)
        
        view.addSubview(profileHeaderView)
        var constraints = [NSLayoutConstraint]()
        
//        let myField = UITextField(frame: CGRect(x: 250, y: 200, width: 120, height: 30))
//        myField.backgroundColor = .green
//        myField.layer.cornerRadius = 20
//        myField.textAlignment = .center
//        myField.text = "Nature"
//        view.addSubview(myField)
        
        let profileheader = ProfileHeaderView()
        profileheader.frame = self.view.frame
        
        
        constraints.append(profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor))

        NSLayoutConstraint.activate(constraints)

    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let profileView = ProfileHeaderView()
        profileView.frame = self.view.frame
    }
 }

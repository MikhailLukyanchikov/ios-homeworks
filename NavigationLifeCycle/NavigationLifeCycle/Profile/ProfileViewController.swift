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
        view.addSubview(profileHeaderView)
        var constraints = [NSLayoutConstraint]()
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

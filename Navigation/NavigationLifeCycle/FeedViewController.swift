//
//  ScheduleViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//

import UIKit

 class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .yellow
        let button = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 30))
        button.backgroundColor = .blue
        button.setTitle("Click Me", for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    @objc func buttonClicked() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
 }
struct Post {
    let title: String = "Post"
}

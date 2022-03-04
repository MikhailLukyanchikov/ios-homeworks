//
//  PostViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 03.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post"
        view.backgroundColor = .some(.gray)
        let post = Post()
        let titleLabel = UILabel()
        titleLabel.text = post.title
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
        
        let rightBarBatton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(buttonInfoClicked))
        navigationItem.rightBarButtonItem = rightBarBatton
        
        let imageView = UIImageView(image: UIImage(named: "image2")!)
        imageView.frame = CGRect(x: 10, y: 100, width: 200, height: 200)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        view.addSubview(imageView)
        let myField = UITextField(frame: CGRect(x: 250, y: 200, width: 120, height: 30))
        myField.backgroundColor = .blue
        myField.layer.cornerRadius = 20
        myField.textAlignment = .center
        myField.text = "Sport"
        view.addSubview(myField)
        
    }
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
        print("Button clicked")
    }
}

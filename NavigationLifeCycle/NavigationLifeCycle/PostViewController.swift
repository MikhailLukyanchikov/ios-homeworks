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
 //     let post = Post()
        let titleLabel = UILabel()
  //    titleLabel.text = post.title
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
        
        let rightBarBatton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(buttonInfoClicked))
        navigationItem.rightBarButtonItem = rightBarBatton
        
        let imageView = UIImageView(image: UIImage(named: "image2")!)
        imageView.frame = CGRect(x: 16, y: 106, width: 150, height: 150)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        view.addSubview(imageView)
        imageView.layer.borderWidth = 3

        let viewLabel = UILabel(frame: CGRect(x: 135, y: 130, width: 180, height: 40))
        viewLabel.text = "NATURE"
        viewLabel.textColor = .black
        viewLabel.font = .systemFont(ofSize: 18, weight: .bold)
        viewLabel.text = "Sport"
        view.addSubview(viewLabel)
        viewLabel.layer.cornerRadius = 5
        viewLabel.textAlignment = .center
        
    }
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
        print("Button clicked")
    }
}

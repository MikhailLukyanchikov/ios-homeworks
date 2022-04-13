//
//  PostViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 03.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    let imageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image2")!)
        imageView.frame = CGRect(x: 16, y: 116, width: 150, height: 150)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        return imageView
    }()
    let myField : UITextField = {
        let myField = UITextField(frame: CGRect(x: 220, y: 136, width: 120, height: 30))
        myField.backgroundColor = .blue
        myField.layer.cornerRadius = 20
        myField.textAlignment = .center
        myField.text = "Sport"
        return myField
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .some(.gray)
        let post = FeedViewController().post
        let titleLabel = UILabel()
        titleLabel.text = post.title
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
        let rightBarBatton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(buttonInfoClicked))
        navigationItem.rightBarButtonItem = rightBarBatton
        view.addSubview(imageView)
        view.addSubview(myField)
    }
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
        print("Button clicked")
    }
}

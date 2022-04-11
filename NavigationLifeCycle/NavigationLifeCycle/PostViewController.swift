//
//  PostViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 03.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Post"
        return label
    }()
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image2")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.layer.borderWidth = 3
        return imageView
    }()
    lazy var viewLabel : UILabel = {
        let viewLabel = UILabel()
        viewLabel.textColor = .black
        viewLabel.font = .systemFont(ofSize: 18, weight: .bold)
        viewLabel.text = "Sport"
        viewLabel.layer.cornerRadius = 5
        viewLabel.textAlignment = .center
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewLabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post"
        view.backgroundColor = .some(.gray)
        navigationItem.titleView = titleLabel
        view.addSubview(imageView)
        view.addSubview(viewLabel)
        let rightBarBatton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(buttonInfoClicked))
        navigationItem.rightBarButtonItem = rightBarBatton
        drawSelf()
    }
//    override func viewDidLayoutSubviews() {
//        super .viewDidLayoutSubviews()
//    }
    func drawSelf() {
        NSLayoutConstraint.activate([self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
                                     self.imageView.widthAnchor.constraint(equalToConstant: 150),
                                     self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor, multiplier: 1.0),
                                     self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 106),
                                     
                                     self.viewLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor,constant: 30),
                                     self.viewLabel.topAnchor.constraint(equalTo: self.imageView.topAnchor,constant: 15),
                                     self.viewLabel.widthAnchor.constraint(equalToConstant: 150),
                                     self.viewLabel.heightAnchor.constraint(equalToConstant: 40)
                                     
        
        
        ])
    }
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: false)
    }
}

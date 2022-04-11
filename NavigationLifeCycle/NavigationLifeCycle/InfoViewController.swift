//
//  InfoViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 03.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    lazy var button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.setTitle("Some Alert", for: .normal)
        button.addTarget(self, action: #selector(alertTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        title = "InfoView"
        self.view.addSubview(button)
    }
    @objc func alertTapped() {
        let alert = UIAlertController(title: "Ready", message: "Some Message", preferredStyle: .alert)
        let buttonAllertYes = UIAlertAction(title: "Ok", style: .default, handler: .none)
        let buttonAllertNo = UIAlertAction(title: "No", style: .destructive, handler: .none)
        present(alert, animated: true, completion: nil)
        alert.addAction(buttonAllertYes)
        alert.addAction(buttonAllertNo)
        print("Alert!")
    }
}

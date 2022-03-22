//
//  ScheduleViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//

import UIKit

 class FeedViewController: UIViewController {
    
    private lazy var firstButton : UIButton = {
        let firstButton = UIButton()
        firstButton.backgroundColor = .gray
        firstButton.setTitle("First Button", for: .normal)
        firstButton.backgroundColor = .orange
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        return firstButton
    }()
    private lazy var secondButton : UIButton = {
        let secondButton = UIButton()
        secondButton.backgroundColor = .orange
        secondButton.setTitle("Second Button", for: .normal)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        return secondButton
    }()
    
    private lazy var labelStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .yellow
        drawself()
        
    }
    @objc func drawself(){
        self.labelStackView.addArrangedSubview(self.firstButton)
        self.labelStackView.addArrangedSubview(self.secondButton)
        self.view.addSubview(labelStackView)
        
        let infotopConstraint = self.labelStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150)
        let infoleadingConstraint = self.labelStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        let infotrailingConstraint = self.labelStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        let infoheightConstraint = self.labelStackView.heightAnchor.constraint(equalToConstant: 154)
        
        NSLayoutConstraint.activate([infotopConstraint, infoheightConstraint,infoleadingConstraint,infotrailingConstraint])
    }
    @objc func buttonClicked() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
 }
struct Post {
    let title: String = "Post"
}

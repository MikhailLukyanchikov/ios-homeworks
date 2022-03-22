//
//  TasksViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//
import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView : ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    private lazy var bottomButton : UIButton = {
        let bottomButton = UIButton()
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.backgroundColor = .systemBlue
        bottomButton.layer.cornerRadius = 22
        bottomButton.layer.shadowColor = UIColor.black.cgColor
        bottomButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        bottomButton.layer.shadowRadius = 4
        bottomButton.layer.shadowOpacity = 0.7
        bottomButton.layer.shadowOpacity = 0.7
        bottomButton.setTitle("Bottom Button", for: .normal)
        return bottomButton
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
        self.setupView()
    }
    private func setupNavBar() {
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    var heightConstraint : NSLayoutConstraint?
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(bottomButton)

        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
       
        let rightSecondButton = self.bottomButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
     
        let bottomSecondButton = self.bottomButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let leftButtonConstraint = self.bottomButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let heighSecondButton = self.bottomButton.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint,rightSecondButton, leftButtonConstraint, bottomSecondButton, heighSecondButton].compactMap({$0}))
    }
}
extension ProfileViewController: ProfileHeaderViewProtocol {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.heightConstraint?.constant = textFieldIsVisible ? 254 : 220
        UIView.animate(withDuration: 0.3, delay: 0.3) {
        self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}

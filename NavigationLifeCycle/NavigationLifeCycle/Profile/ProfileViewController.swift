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
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint].compactMap({$0}))
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

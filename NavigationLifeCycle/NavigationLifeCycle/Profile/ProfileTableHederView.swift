//
//  ProfileTableHederView.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 30.03.2022.
//

// class ProfileViewController: UIViewController
import UIKit

class ProfileTableHederView: UIView {

    private lazy var profileHeaderView : ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
        
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setupNavBar()
//        self.setupView()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavBar() {
//        self.navigationItem.title = "Profile"
//        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    var heightConstraint : NSLayoutConstraint?
    
    private func setupView() {
        self.addSubview(self.profileHeaderView)
        self.backgroundColor = .white
   
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)

        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint].compactMap({$0}))
    }
}
extension ProfileTableHederView: ProfileHeaderViewProtocol {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.heightConstraint?.constant = textFieldIsVisible ? 254 : 220
        UIView.animate(withDuration: 0.3, delay: 0.3) {
    //    self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}





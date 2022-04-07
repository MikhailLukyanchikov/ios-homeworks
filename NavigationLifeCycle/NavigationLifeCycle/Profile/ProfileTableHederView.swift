//
//  ProfileTableHederView.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 30.03.2022.
//

import UIKit

class ProfileTableHederView: UITableViewHeaderFooterView {
        private lazy var profileHeaderView : ProfileHeaderView = {
            let view = ProfileHeaderView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.delegate = self
            view.tag = 2
            return view
        }()
        override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            configureContents()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configureContents() {
            self.addSubview(self.profileHeaderView)
            self.backgroundColor = .lightGray
            let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
            let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
            let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
            let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 274)
            NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint].compactMap({$0}))
        }
    }
extension ProfileTableHederView: ProfileHeaderViewProtocol {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3, delay: 0.3) {
        } completion: { _ in
            completion()
        }
    }
}




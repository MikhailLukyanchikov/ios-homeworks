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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
      //  tableView.register(DynamicArticleTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
        self.setupView()
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    private func setupNavBar() {
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    var heightConstraint : NSLayoutConstraint?
    
    private func setupView() {
        
        
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
        self.view.backgroundColor = .black
        self.view.addSubview(self.tableView)
        
        let tableTopConstraint = self.tableView.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor, constant: 20)
        let tableLeadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let tableTrailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let tableBbottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
 
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)

        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint,
                                    tableTopConstraint, tableLeadingConstraint, tableTrailingConstraint, tableBbottomConstraint].compactMap({$0}))
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



}

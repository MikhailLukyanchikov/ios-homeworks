//
//  TasksViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//
/*
import UIKit

class ProfileViewController: UIViewController {

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
    
    private var dataSource: [Post] = []
    
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

struct ViewModel : ViewModelProtocol {
    let author : String
    let description : String
    let image : String
    var likes : Int
    var views : Int
}
var post1 = Post(author: "https://www.comnews.ru/", description: "МегаФон вышел в открытый космос", image: "Космос", likes: 155, views: 905)
var post2 = Post(author: "www.championat.com", description: "От бумеров до зумеров: какой спорт популярен среди разных поколений?", image: "Sport", likes: 25, views: 301)
var post3 = Post(author: "https://work-way.com/", description: "Наука — враг случайностей", image: "Science", likes: 922, views: 1405)
var post4 = Post(author: "https://www.forbes.ru/", description: "«Зажмуриться и надеяться, что это чудовище исчезнет»: как мы переживаем страх войны", image: "War", likes: 5, views: 33)
var posts = [post1, post2, post3, post4]

*/


import UIKit

class ProfileViewController : UIViewController {

    let tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
      //  table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        view.addSubview(tableview)
        
    }
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
}
    
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220 // 308
    }
}







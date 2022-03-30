//
//  TasksViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//
import UIKit

class ProfileViewController : UIViewController {

    let tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
      //  table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(MyCustomHeader.self,
            forHeaderFooterViewReuseIdentifier: "sectionHeader")
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()
    
//    private lazy var profileHeaderView : ProfileHeaderView = {   //НОВОЕ
//        let view = ProfileHeaderView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.delegate = self
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        view.addSubview(tableview)
        setupView()  //NEW

    }

    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        tableview.frame = view.bounds
       //tableview.frame = .init(x: 0, y: 354, width: view.bounds.width, height: view.bounds.height-354)
    }
    
    var heightConstraint : NSLayoutConstraint?  //NEW
    
    private func setupView() {    //NEW
     //   self.view.addSubview(self.profileHeaderView)
//        self.view.backgroundColor = .lightGray
//
//        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
//        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
//        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
//        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
//
//        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint].compactMap({$0}))
    }
}
    
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.configure(author: posts[indexPath.row].author, imageName: ((images[indexPath.row] ?? UIImage(named: "sport1"))!), description: posts[indexPath.row].description, likes: posts[indexPath.row].likes, views: posts[indexPath.row].views)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550 // 308
    }
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! MyCustomHeader
//        view.title.text = "some text"
//       view.image.image = UIImage(named: "image")

       return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 274
    }
}

extension ProfileViewController: ProfileHeaderViewProtocol {   //New
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.heightConstraint?.constant = textFieldIsVisible ? 254 : 220
        UIView.animate(withDuration: 0.3, delay: 0.3) {
    //    self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}

struct Post  {
    let author : String
    let description : String
    let image : String
    var likes : Int
    var views : Int
}
var images : [UIImage?] = [UIImage(named: "sport1"), UIImage(named: "Space1"), UIImage(named: "war2"), UIImage(named: "science1")]
var post2 = Post(author: "https://www.comnews.ru/", description: "МегаФон вышел в открытый космос", image: "Космос", likes: 155, views: 905)
var post1 = Post(author: "www.championat.com", description: "От бумеров до зумеров: какой спорт популярен среди разных поколений?", image: "Sport", likes: 25, views: 66)
var post4 = Post(author: "https://work-way.com/", description: "Наука — враг случайностей", image: "Science", likes: 922, views: 1405)
var post3 = Post(author: "https://www.forbes.ru/", description: "«Зажмуриться и надеяться, что это чудовище исчезнет»: как мы переживаем страх войны", image: "War", likes: 37, views: 101)
var posts = [post1, post2, post3, post4]







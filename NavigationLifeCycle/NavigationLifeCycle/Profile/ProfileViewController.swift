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
        table.register(ProfileTableHederView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
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
                   "sectionHeader") as! ProfileTableHederView
       return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 274
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







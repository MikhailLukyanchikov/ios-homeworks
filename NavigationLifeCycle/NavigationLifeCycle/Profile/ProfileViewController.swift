//
//  TasksViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//
import UIKit

class ProfileViewController : UIViewController {
    
    let myView : UIView = {
        let view = UIView()
        view.frame = .init(x: 70, y: 70, width: 30, height: 30)
        view.backgroundColor = .orange
        return view
    }()
    var isExpanded = false
    
    let sizeFoto = (UIScreen.main.bounds.width - 48)/4 + 56
    let arrowSymbol = "\u{2192}"
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private let tapGestureRecogniaer = UITapGestureRecognizer()

    let tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(ProfileTableHederView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        tableview.dataSource = self
        tableview.delegate = self
        view.addSubview(tableview)
        setupGesture()
    }
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    private func setupGesture(){
        self.tapGestureRecogniaer.addTarget(self, action: #selector(self.habdleTapGesture(_:)))
        tableview.addGestureRecognizer(tapGestureRecogniaer)
        self.panGestureRecognizer.addTarget(self, action: #selector(self.habdlePanGesture(_:)))
        tableview.addGestureRecognizer(panGestureRecognizer)
        print("Gesture")
    }

    @objc func habdlePanGesture(_ gestureRecogniser : UIPanGestureRecognizer) {
        self.panGestureRecognizer.addTarget(self, action: #selector(self.habdlePanGesture(_:)))
        tableview.addGestureRecognizer(panGestureRecognizer)
        print("AAAA")

    }
    @objc func habdleTapGesture(_ gestureRecogniser: UITapGestureRecognizer) {
        guard self.tapGestureRecogniaer === gestureRecogniser else { return }
     //   self.tapGestureRecogniaer.addTarget(self, action: #selector(self.habdleTapGesture(_:)))
        tableview.addGestureRecognizer(tapGestureRecogniaer)
        self.isExpanded.toggle()
     //   tableview.viewWithTag(2)?.alpha = self.isExpanded ? 0.2 : 1
      //  tableview.alpha = self.isExpanded ? 0.2 : 1
        
        UIView.animate(withDuration: 2) {
            self.tableview.layoutIfNeeded()
            self.tableview.viewWithTag(2)?.viewWithTag(1)?.alpha = self.isExpanded ? 0.2 : 1
            self.tableview.viewWithTag(2)?.viewWithTag(1)?.layer.cornerRadius = self.isExpanded ? 0 : 75
            self.view.addSubview(self.myView)
            self.tableview.backgroundColor = .init(white: 0.3, alpha: 0.2)
            self.tableview.alpha = self.isExpanded ? 0.2 : 1
            NSLayoutConstraint.activate([self.tableview.viewWithTag(2)?.viewWithTag(1)?.widthAnchor.constraint(equalToConstant: 300)].compactMap({$0}))
            
            if self.isExpanded {
            NSLayoutConstraint.activate([self.tableview.viewWithTag(2)?.viewWithTag(1)?.widthAnchor.constraint(equalToConstant: 300)].compactMap({$0}))
            } else {
                NSLayoutConstraint.activate([self.tableview.viewWithTag(2)?.viewWithTag(1)?.widthAnchor.constraint(equalToConstant: 150)].compactMap({$0}))
            }
        } completion: {_ in
            
        }
       
        
        print("BBB")
    }
    
    
    
}
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count+1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row != 0 else {
            guard let cellStart = tableview.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as? PhotosTableViewCell else {return UITableViewCell()}
            return cellStart
        }
      guard let cell = tableview.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell
    else { return UITableViewCell()}

        cell.configure(author: posts[indexPath.row-1].author, imageName: ((images[indexPath.row-1] ?? UIImage(named: "sport1"))!), description: posts[indexPath.row-1].description, likes: posts[indexPath.row-1].likes, views: posts[indexPath.row-1].views)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return sizeFoto}
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
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







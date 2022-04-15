//
//  TasksViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 21.02.2022.
//
import UIKit

class ProfileViewController : UIViewController {
    
    let sizeX = UIScreen.main.bounds.width
    let sizeY = UIScreen.main.bounds.height
    private var isExpanded = false
    let sizeFoto = (UIScreen.main.bounds.width - 48)/4 + 56
    let arrowSymbol = "\u{2192}"
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private let tapGestureRecogniaer = UITapGestureRecognizer()
    private let tapLabelGestureRecogniaer = UITapGestureRecognizer()

    private lazy var likesCount : Int = 0

    lazy var label : UILabel = {
        let secondButton = UILabel()
        secondButton.text = "X"
        secondButton.textColor = .black
        secondButton.tag = 5
        secondButton.isHidden = true
        secondButton.alpha = 0
        secondButton.isUserInteractionEnabled = true
        secondButton.addGestureRecognizer(tapLabelGestureRecogniaer)
        return secondButton
    }()
    lazy var myView : UIImageView = {
        let image = self.tableview.viewWithTag(2)?.viewWithTag(1)?.largeContentImage
        let view = UIImageView(image: image)
        view.frame = .init(x: 0, y: 200, width: sizeX, height: sizeY-400)
        view.isHidden = true
        view.alpha = 0
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapLabelGestureRecogniaer)
        return view
    }()
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
        tableview.frame = view.bounds
        self.tapLabelGestureRecogniaer.addTarget(self, action: #selector(self.habdleTapLabelGesture(_:)))
    }

    @objc func habdleTapLabelGesture(_ gestureRecogniser: UITapGestureRecognizer) {
        guard self.tapLabelGestureRecogniaer === gestureRecogniser else { return }
        self.isExpanded.toggle()
        UIView.animate(withDuration: 0.5) {
            if !self.isExpanded {
                self.tableview.viewWithTag(2)?.viewWithTag(1)?.alpha = 1
                self.tableview.viewWithTag(2)?.viewWithTag(1)?.layer.cornerRadius = 75
                self.myView.alpha = 0
                self.tableview.alpha = 1
                self.tableview.willRemoveSubview(self.myView)
                self.label.alpha = 0
                self.label.isHidden = true
            }
        } completion: {_ in
        }
    }
    @objc func habdleTapGesture(_ gestureRecogniser: UITapGestureRecognizer) {
        guard self.tapGestureRecogniaer === gestureRecogniser else { return }
        self.isExpanded.toggle()
        UIView.animate(withDuration: 0.5) {
            self.tableview.layoutIfNeeded()
            if self.isExpanded {
                self.tableview.viewWithTag(2)?.viewWithTag(1)?.alpha = 0
                self.tableview.viewWithTag(2)?.viewWithTag(1)?.layer.cornerRadius = 0
                self.view.addSubview(self.myView)
                self.myView.alpha = 1
                self.myView.isHidden = false
                self.tableview.alpha = 0.2
                UIView.animate(withDuration: 0.3,delay: 0.5) {
                    self.myView.addSubview(self.label)
                    self.label.frame = CGRect(x: self.sizeX-20, y: 10, width: 15, height: 15)
                    self.label.alpha = 1
                    self.label.isHidden = false
                } completion: {_ in
                }
            }
        } completion: {_ in
        }
    }
}
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Posts-", posts.count+1)
        return posts.count+1
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row != 0 else {
            guard let cellStart = tableview.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as? PhotosTableViewCell else {return UITableViewCell()}
            cellStart.layer.borderWidth = 5
            cellStart.layer.borderColor = .init(gray: 0.5, alpha: 0.8)
            return cellStart
        }
      guard let cell = tableview.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell
    else { return UITableViewCell()}
        cell.setNeedsLayout()
        cell.setNeedsDisplay()
        cell.configure(author: posts[indexPath.row-1].author, imageName: ((images[indexPath.row-1] ?? UIImage(named: "sport1"))!), description: posts[indexPath.row-1].description)
        print("Index", indexPath)
        cell.delegate = self
        cell.viewDelegate = self
        cell.setNeedsLayout()
        cell.setNeedsDisplay()
        cell.contentView.setNeedsDisplay()
        cell.contentView.setNeedsLayout()
        cell.contentView.reloadInputViews()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return sizeFoto}
        return 550
    }

    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! ProfileTableHederView
        self.tapGestureRecogniaer.addTarget(self, action: #selector(self.habdleTapGesture(_:)))
        view.viewWithTag(1)?.addGestureRecognizer(tapGestureRecogniaer)
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
extension ProfileViewController : PostTableViewProtocol {
    func didTapLikeButton(indexPath: Int, completion: @escaping () -> Void) {
        likesCount = indexPath
        print("LikeCount", likesCount)
        UIView.animate(withDuration: 0.3, delay: 0.3) {
        } completion: { _ in
            completion()
        }
    }
}
extension ProfileViewController : PostTableViewImageProtocol {
    func didTapViewButton(indexPath: Int, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 1) {
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
var images : [UIImage?] = [UIImage(named: "sport1"), UIImage(named: "Space1"), UIImage(named: "war2"), UIImage(named: "science1"), UIImage(named: "Space1")]
var post2 = Post(author: "https://www.comnews.ru/", description: "МегаФон вышел в открытый космос", image: "Космос", likes: 0, views: 0)
var post1 = Post(author: "www.championat.com", description: "От бумеров до зумеров: какой спорт популярен среди разных поколений?", image: "Sport", likes: 0, views: 0)
var post4 = Post(author: "https://work-way.com/", description: "Наука — враг случайностей", image: "Science", likes: 0, views: 0)
var post3 = Post(author: "https://www.forbes.ru/", description: "«Зажмуриться и надеяться, что это чудовище исчезнет»: как мы переживаем страх войны", image: "War", likes: 0, views: 0)
var posts = [post1, post2, post3, post4]






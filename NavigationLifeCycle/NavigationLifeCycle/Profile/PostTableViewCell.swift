//
//  CustomTableViewCell.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 30.03.2022.
//

import UIKit

protocol PostTableViewProtocol : AnyObject {
    func didTapLikeButton(indexPath: Int, completion: @escaping () -> Void)
}

class PostTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    let screenSize = UIScreen.main.bounds.width
    private let tapGestureRecogniaer = UITapGestureRecognizer()
    private let tapViewGestureRecogniaer = UITapGestureRecognizer()
    weak var delegate : PostTableViewProtocol?
    var LikeCount = 0
    var ViewCount = 0
    
    lazy var textm : UITextView = {
        let text = UITextView()
        text.text = posts[1].description
        text.textColor = .black

        text.textAlignment = .center
      //  text.backgroundColor = .green
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isHidden = false
        return text
    }()
    
    private lazy var authorLabel : UILabel = {
        let author = UILabel()
        author.font = .systemFont(ofSize: 20, weight: .bold)
        author.backgroundColor = .white
        author.textColor = .black
        author.numberOfLines = 2
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    private lazy var descriptionLabel : UILabel = {
        let description = UILabel()
        description.backgroundColor = .white
        description.textColor = .systemGray
        description.numberOfLines = 0
        description.font = .systemFont(ofSize: 14, weight: .medium)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    private lazy var myImage: UIImageView = {
        let image = UIImage(named: "image")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapViewGestureRecogniaer)
        return imageView
    }()
    private lazy var likes : UILabel = {
        let likes = UILabel()
        likes.backgroundColor = .white
        likes.tintColor = .black
        likes.font = .systemFont(ofSize: 14, weight: .medium)
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.addGestureRecognizer(tapGestureRecogniaer)
        likes.isUserInteractionEnabled = true
        return likes
    }()

    private lazy var views : UILabel = {
        let views = UILabel()
        views.backgroundColor = .white
        views.font = .systemFont(ofSize: 14, weight: .medium)
        views.tintColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    override init(style : UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(myImage)
        contentView.addSubview(likes)
        contentView.addSubview(views)
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(textm)
        setConstraints()
        self.tapGestureRecogniaer.addTarget(self, action: #selector(self.habdleTapGesture(_:)))
        self.tapViewGestureRecogniaer.addTarget(self, action: #selector(self.habdleTapGesture(_:)))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(author: String, imageName : UIImage, description : String, likes : Int, views : Int) {
        authorLabel.text = author
        myImage.image = imageName
        descriptionLabel.text = description
        self.likes.text = "Likes:" + String(self.LikeCount)
        self.views.text = "Views:" + String(self.ViewCount)
    }
    override func prepareForReuse() {
        authorLabel.text = nil
        myImage.image = nil
        descriptionLabel.text = nil
        self.likes.text = nil
        self.views.text = nil
    }
    
    @objc func habdleTapGesture(_ gestureRecogniser: UITapGestureRecognizer) {
    //   guard
//        self.tapGestureRecogniaer === gestureRecogniser //else { //return}
//       self.delegate?.didTapLikeButton(indexPath: self.LikeCount){ [weak self] in
//            self?.LikeCount += 1
//            self?.likes.text = "Likes:" + String((self?.LikeCount)!)
//            }
        guard self.tapViewGestureRecogniaer === gestureRecogniser else { return }
        self.delegate?.didTapLikeButton(indexPath: self.ViewCount){ [weak self] in
         print("HoHo")
            self?.textm.isHidden = false
             self?.ViewCount += 1
             self?.views.text = "Views:" + String((self?.ViewCount)!)
                 UIView.animate(withDuration: 2.5) {
                     self?.textm.isHidden = false
                    // view.frame = CGRect(x: 0, y: 200, width: Int(self.sizeX), height: Int(self.sizeX))
                //     self?.contentView.alpha = 0.2
                 } completion: {_ in
                     self?.textm.isHidden = true
                //     self?.contentView.alpha = 1
                 }
             }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([self.authorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     self.authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     self.authorLabel.heightAnchor.constraint(equalToConstant: 20),
                                     self.authorLabel.widthAnchor.constraint(equalToConstant: screenSize-16),
                                     
                                     self.descriptionLabel.topAnchor.constraint(equalTo: self.myImage.bottomAnchor),
                                     self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     self.descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
                                     self.descriptionLabel.widthAnchor.constraint(equalToConstant: screenSize-16),
                                                                          
                                     self.myImage.topAnchor.constraint(equalTo: self.contentView.topAnchor , constant: 20),
                                     self.myImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     self.myImage.heightAnchor.constraint(equalToConstant: screenSize),
                                     self.myImage.widthAnchor.constraint(equalToConstant: screenSize),
                                     
                                     self.likes.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     self.likes.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10),
                                     self.likes.heightAnchor.constraint(equalToConstant: 20),
                                     self.likes.widthAnchor.constraint(equalToConstant: 80),
                                     
                                     self.views.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     self.views.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -40),
                                     self.views.heightAnchor.constraint(equalToConstant: 20),
                                     self.views.widthAnchor.constraint(equalToConstant: 80),
        
                                     self.textm.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     self.textm.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     self.textm.heightAnchor.constraint(equalToConstant: screenSize/3),
                                     self.textm.widthAnchor.constraint(equalToConstant: screenSize)
        ])
    }
}

    
    


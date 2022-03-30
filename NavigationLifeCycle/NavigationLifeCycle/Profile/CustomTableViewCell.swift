//
//  CustomTableViewCell.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 30.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    let screenSize = UIScreen.main.bounds.width
    
    private lazy var authoLbel : UILabel = {
        let author = UILabel()
        author.font = .systemFont(ofSize: 20, weight: .bold)
        author.backgroundColor = .white
        author.textColor = .black
        author.numberOfLines = 2
        author.text = "CSKA"
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    private lazy var descriptionLabel : UILabel = {
        let description = UILabel()
        description.backgroundColor = .white
        description.textColor = .systemGray
        description.numberOfLines = 0
        description.font = .systemFont(ofSize: 14, weight: .medium)
        description.text = "fewdwdwewefwf wedweccewcewc fewcewcececececec    sceewcecec ecececece ececece"
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    private lazy var myImage: UIImageView = {
        let image = UIImage(named: "image")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var likes : UILabel = {
        let likes = UILabel()
        likes.backgroundColor = .white
        likes.tintColor = .black
        likes.text = "Likes:"
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    private lazy var views : UILabel = {
        let views = UILabel()
        views.backgroundColor = .white
        views.font = .systemFont(ofSize: 14, weight: .medium)
        views.tintColor = .black
        views.text = "Views:"
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    override init(style : UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
      //  myImage.image = UIImage(named: "image2")
        contentView.addSubview(myImage)
        contentView.addSubview(likes)
        contentView.addSubview(views)
        contentView.addSubview(authoLbel)
        contentView.addSubview(descriptionLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([self.authoLbel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     self.authoLbel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
                                     self.authoLbel.heightAnchor.constraint(equalToConstant: 20),
                                     self.authoLbel.widthAnchor.constraint(equalToConstant: screenSize-16),
                                     
                                     self.descriptionLabel.topAnchor.constraint(equalTo: self.myImage.bottomAnchor, constant: 15),
                                     self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
                                     self.descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
                                     self.descriptionLabel.widthAnchor.constraint(equalToConstant: screenSize-16),
                                                                          
                                     self.myImage.topAnchor.constraint(equalTo: self.contentView.topAnchor , constant: 20),
                                     self.myImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     self.myImage.heightAnchor.constraint(equalToConstant: screenSize),
                                     self.myImage.widthAnchor.constraint(equalToConstant: screenSize),
                                     
                                     self.likes.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     self.likes.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10),
                                     self.likes.heightAnchor.constraint(equalToConstant: 20),
                                     self.likes.widthAnchor.constraint(equalToConstant: 50),
                                     
                                     self.views.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     self.views.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -40),
                                     self.views.heightAnchor.constraint(equalToConstant: 20),
                                     self.views.widthAnchor.constraint(equalToConstant: 50)])
    }
}

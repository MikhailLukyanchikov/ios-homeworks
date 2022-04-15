//
//  CustomTableViewCell.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 30.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
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
    private lazy var mainImage: UIImageView = {
        let image = UIImage(named: "image")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var likesCountLabel : UILabel = {
        let likes = UILabel()
        likes.backgroundColor = .white
        likes.tintColor = .black
        likes.font = .systemFont(ofSize: 14, weight: .medium)
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.tag = 5
        return likes
    }()
    private lazy var viewsCountLabel : UILabel = {
        let views = UILabel()
        views.backgroundColor = .white
        views.font = .systemFont(ofSize: 14, weight: .medium)
        views.tintColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    private lazy var labelStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style : UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(labelStackView)
        labelStackView.addArrangedSubview(authorLabel)
        labelStackView.addArrangedSubview(mainImage)
        labelStackView.addArrangedSubview(descriptionLabel)
        contentView.addSubview(likesCountLabel)
        contentView.addSubview(viewsCountLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(author: String, imageName : UIImage, description : String, likes : Int, views : Int) {
        authorLabel.text = author
        mainImage.image = imageName
        descriptionLabel.text = description
        self.likesCountLabel.text = "Likes:" + String(likes)
        self.viewsCountLabel.text = "Views:" + String(views)
    }
    override func prepareForReuse() {
        authorLabel.text = nil
        mainImage.image = nil
        descriptionLabel.text = nil
        self.likesCountLabel.text = nil
        self.viewsCountLabel.text = nil
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([self.labelStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     self.labelStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     self.labelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     self.labelStackView.heightAnchor.constraint(equalToConstant: 530),
                                     
                                     self.authorLabel.heightAnchor.constraint(equalToConstant: 20),
                                     self.descriptionLabel.heightAnchor.constraint(equalToConstant: 60),

                                     self.likesCountLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     self.likesCountLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     
                                     self.viewsCountLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     self.viewsCountLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)])
    }
}

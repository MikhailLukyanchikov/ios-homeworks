//
//  PhotosTableViewCell.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 03.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    static let identifier = "PhotosTableViewCell"

    private lazy var myImage: UIImageView = {
        let image = UIImage(named: "foto1")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(style : UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(myImage)
        contentView.addConstraint(self.contentView.heightAnchor.constraint(equalToConstant: 50))

        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([self.myImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     self.myImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     self.myImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     self.myImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -300)
        
        ])
        
        
        
//        NSLayoutConstraint.activate([self.authorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//                                     self.authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//                                     self.authorLabel.heightAnchor.constraint(equalToConstant: 20),
//                                     self.authorLabel.widthAnchor.constraint(equalToConstant: screenSize-16),
//
//                                     self.descriptionLabel.topAnchor.constraint(equalTo: self.myImage.bottomAnchor),
//                                     self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//                                     self.descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
//                                     self.descriptionLabel.widthAnchor.constraint(equalToConstant: screenSize-16),
//
//                                     self.myImage.topAnchor.constraint(equalTo: self.contentView.topAnchor , constant: 20),
//                                     self.myImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//                                     self.myImage.heightAnchor.constraint(equalToConstant: screenSize),
//                                     self.myImage.widthAnchor.constraint(equalToConstant: screenSize),
//
//                                     self.likes.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//                                     self.likes.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10),
//                                     self.likes.heightAnchor.constraint(equalToConstant: 20),
//                                     self.likes.widthAnchor.constraint(equalToConstant: 80),
//
//                                     self.views.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//                                     self.views.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -40),
//                                     self.views.heightAnchor.constraint(equalToConstant: 20),
//                                     self.views.widthAnchor.constraint(equalToConstant: 80)])
    }
}

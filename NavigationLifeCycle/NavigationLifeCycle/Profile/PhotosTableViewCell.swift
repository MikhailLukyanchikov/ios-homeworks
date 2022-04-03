//
//  PhotosTableViewCell.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 03.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    static let identifier = "PhotosTableViewCell"
    let sizeFoto = (UIScreen.main.bounds.width - 48)/4
    private lazy var myImage1: UIImageView = {
        let image = UIImage(named: "foto1")
        let imageView = UIImageView(image: image)
  //      imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
   //     imageView.widthAnchor.constraint(equalToConstant: sizeFoto).isActive
        return imageView
    }()
    private lazy var myImage2: UIImageView = {
        let image = UIImage(named: "foto2")
        let imageView = UIImageView(image: image)
   //     imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    private lazy var myImage3: UIImageView = {
        let image = UIImage(named: "foto3")
        let imageView = UIImageView(image: image)
   //     imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    private lazy var myImage4: UIImageView = {
        let image = UIImage(named: "foto4")
        let imageView = UIImageView(image: image)
   //     imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    private lazy var labelStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var label : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.backgroundColor = .white
        label.textColor = .black
 //       label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var labelArrow : UILabel = {
        let label = UILabel ()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "\u{2192}"
        label.backgroundColor = .white
        label.textColor = .black
 //       label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style : UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        labelStackView.addArrangedSubview(myImage1)
        labelStackView.addArrangedSubview(myImage2)
        labelStackView.addArrangedSubview(myImage3)
        labelStackView.addArrangedSubview(myImage4)
        contentView.addSubview(label)
        contentView.addSubview(labelArrow)
        contentView.addSubview(labelStackView)
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
NSLayoutConstraint.activate([    self.labelStackView.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 12),
                                 self.labelStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 12),
                                 self.labelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -12),
                                 self.labelStackView.heightAnchor.constraint(equalToConstant: sizeFoto),

                                  self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant:12),
                                  self.label.heightAnchor.constraint(equalToConstant: 20),
                                  self.label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 12),
                                  self.label.widthAnchor.constraint(equalToConstant: 80),

                                  self.labelArrow.centerYAnchor.constraint(equalTo: self.label.centerYAnchor),
                                  self.labelArrow.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12)])

    }
}

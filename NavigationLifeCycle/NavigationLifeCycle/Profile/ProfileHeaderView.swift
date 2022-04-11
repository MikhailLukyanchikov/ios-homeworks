//
//  ProfileHeaderView.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 09.03.2022.
//

import UIKit

protocol ProfileHeaderViewProtocol : AnyObject {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)

}
final class ProfileHeaderView: UIView {
    var imageViewAspectRatio : NSLayoutConstraint?
    var isShow = true
    private var buttonTopConstraint : NSLayoutConstraint?
    weak var delegate : ProfileHeaderViewProtocol?
    private var currentStatus : String = ""
    
     var avatarImageView : UIImageView = {
        let profileImage = UIImage(named: "image")
        let imageView = UIImageView(image: profileImage)
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.tag = 1
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    private lazy var fullNameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = .lightGray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "NATURE"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        return nameLabel
    }()
    private lazy var statusLabel : UILabel = {
        let statusLabel = UILabel()

        statusLabel.text = "Waiting for something..."
        statusLabel.backgroundColor = .lightGray
        statusLabel.textColor = .darkGray
        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private lazy var statusButton : UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 22
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Show Status", for: .normal)
        statusButton.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
        return statusButton
    }()
    private lazy var labelStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var infoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isHidden = false
        textField.backgroundColor = .brown
        textField.placeholder = "Status is  "
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.borderStyle = .line
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 15
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.textAlignment = .center
        return textField
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.labelStackView.addArrangedSubview(self.fullNameLabel)
        self.labelStackView.addArrangedSubview(self.statusLabel)
        self.infoStackView.addArrangedSubview(self.avatarImageView)
        self.infoStackView.addArrangedSubview(self.labelStackView)
        self.addSubview(self.infoStackView)
        self.addSubview(self.statusButton)
        self.addSubview(self.textField)
        self.addSubview(textField)
        self.backgroundColor = .lightGray


        self.imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)
        self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 20)
        self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)

        NSLayoutConstraint.activate([self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor),
                                     self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                                     self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                                     self.infoStackView.heightAnchor.constraint(equalToConstant: 150),
                                     
                                     self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                                     self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                                     self.statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
                                     self.statusButton.heightAnchor.constraint(equalToConstant: 50),
                                     
                                     self.textField.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 10),
                                     self.textField.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor),
                                     self.textField.trailingAnchor.constraint(equalTo: self.statusLabel.trailingAnchor),
                                     self.textField.heightAnchor.constraint(equalToConstant: 34),
                                        
                                    imageViewAspectRatio ].compactMap({$0}))
    }
    @objc private func didTapStatusButton() {
        isShow.toggle()
            if isShow {
                textField.text = ""
                statusButton.setTitle("Set Status", for: .normal)
                statusLabel.text = currentStatus
            } else {
                statusButton.setTitle("Show Status", for: .normal)
                currentStatus = !textField.text!.isEmpty ? textField.text! : "No status"
            }
        self.delegate?.didTapStatusButton(textFieldIsVisible: self.textField.isEnabled) { [weak self] in
            self?.textField.isEnabled.toggle()

        }
    }
}

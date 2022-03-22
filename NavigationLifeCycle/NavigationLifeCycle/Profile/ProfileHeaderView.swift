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
    
    private lazy var avatarImageView : UIImageView = {
        let profileImage = UIImage(named: "image")
        let imageView = UIImageView(image: profileImage)
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
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
        textField.isHidden = true
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
    
    private var buttonTopConstraint : NSLayoutConstraint?
    weak var delegate : ProfileHeaderViewProtocol?
    
    private var currentStatus : String = ""
    
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
 //       self.addSubview(self.avatarImageView)
        self.addSubview(self.infoStackView)
        self.addSubview(self.statusButton)
        self.addSubview(self.textField)


        let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)

        let infotopConstraint = self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let infoleadingConstraint = self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        let infotrailingConstraint = self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        let infoheightConstraint = self.infoStackView.heightAnchor.constraint(equalToConstant: 150)
        
        self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 20)
        self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
        let leadingButtonConstraint = self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        let trailingButtonConstraint = self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        let bottomButtonConstraint = self.statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let heightButtomConstraint = self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        
        NSLayoutConstraint.activate([buttonTopConstraint, bottomButtonConstraint, trailingButtonConstraint, leadingButtonConstraint, infotopConstraint, infoheightConstraint,infoleadingConstraint,infotrailingConstraint, heightButtomConstraint, imageViewAspectRatio].compactMap({$0}))

    }
    
    @objc private func didTapStatusButton() {
            if self.textField.isHidden {
                self.addSubview(self.textField)
                textField.text = ""
                statusButton.setTitle("Set Status", for: .normal)
                statusLabel.text = currentStatus
                self.buttonTopConstraint?.isActive = false
                let topConstraint = self.textField.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 10)
                let leadingConstraint = self.textField.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor)
                let trailingConstraint = self.textField.trailingAnchor.constraint(equalTo: self.statusLabel.trailingAnchor)
                let heightTextFieldConstraint = self.textField.heightAnchor.constraint(equalToConstant: 34)
                self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 10)
                
                NSLayoutConstraint.activate([
                    topConstraint, leadingConstraint, trailingConstraint, heightTextFieldConstraint, self.buttonTopConstraint
                ].compactMap({ $0 }))
            } else {
                self.willRemoveSubview(self.textField)
                statusButton.setTitle("Show Status", for: .normal)
                currentStatus = !textField.text!.isEmpty ? textField.text! : "No status"
                self.buttonTopConstraint?.isActive = false
                self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 20)
                NSLayoutConstraint.activate([self.buttonTopConstraint].compactMap({$0}))
                
            }
        self.delegate?.didTapStatusButton(textFieldIsVisible: self.textField.isHidden) { [weak self] in
                   self?.textField.isHidden.toggle()
        }
    }
}

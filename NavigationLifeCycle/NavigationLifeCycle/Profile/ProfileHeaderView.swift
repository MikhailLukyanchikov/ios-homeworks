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
        //imageView.backgroundColor = .black
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 154).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 154).isActive = true
        imageView.layer.cornerRadius = 75
        return imageView
    }()
    private lazy var fullNameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = .green
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    private lazy var statusLabel : UILabel = {
        let birdthLabel = UILabel()
        birdthLabel.backgroundColor = .blue
        birdthLabel.translatesAutoresizingMaskIntoConstraints = false
        return birdthLabel
    }()
    private lazy var statusButton : UIButton = {
        let statusButton = UIButton()
        statusButton.backgroundColor = .orange
        statusButton.translatesAutoresizingMaskIntoConstraints = false
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var buttonTopConstraint : NSLayoutConstraint?
    weak var delegate : ProfileHeaderViewProtocol?
    
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


        let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)

        let infotopConstraint = self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let infoleadingConstraint = self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        let infotrailingConstraint = self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        let infoheightConstraint = self.infoStackView.heightAnchor.constraint(equalToConstant: 154)
        
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
                
                self.buttonTopConstraint?.isActive = false
                let topConstraint = self.textField.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 10)
                let leadingConstraint = self.textField.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor)
                let trailingConstraint = self.textField.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
                let heightTextFieldConstraint = self.textField.heightAnchor.constraint(equalToConstant: 34)
                self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 10)
                
                NSLayoutConstraint.activate([
                    topConstraint, leadingConstraint, trailingConstraint, heightTextFieldConstraint, self.buttonTopConstraint
                ].compactMap({ $0 }))
            } else {
                self.willRemoveSubview(self.textField)
                self.buttonTopConstraint?.isActive = false
                self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 20)
                NSLayoutConstraint.activate([self.buttonTopConstraint].compactMap({$0}))
                
            }
            
        self.delegate?.didTapStatusButton(textFieldIsVisible: self.textField.isHidden) { [weak self] in
                   self?.textField.isHidden.toggle()
        }
    }
}

    

//        private func setupView() {

//        let profileImage = UIImage(named: "image")
//        let profileImageView = UIImageView(image: profileImage)
//        profileImageView.frame = CGRect(x: 16, y: 106, width: 150, height: 150)
//        profileImageView.layer.masksToBounds = true
//        profileImageView.layer.cornerRadius = 75
//
//        viewLabel.text = "NATURE"
//        viewLabel.textColor = .black
//        viewLabel.font = .systemFont(ofSize: 18, weight: .bold)

//
//        let profileButton = UIButton(frame: CGRect(x: 16, y: 280, width: 360, height: 50))
//        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        profileButton.setTitle("Show Status", for: .normal)
//        profileButton.backgroundColor = .systemBlue
//        profileButton.layer.cornerRadius = 22
//        profileButton.layer.shadowColor = UIColor.black.cgColor
//        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
//        profileButton.layer.shadowRadius = 4
//        profileButton.layer.shadowOpacity = 0.7
//        profileButton.layer.shadowOpacity = 0.7

//
//        textField.placeholder = "Waiting for something..."
//        textField.returnKeyType = .done
//        textField.autocapitalizationType = .words
//        textField.font = .systemFont(ofSize: 14)
//        textField.textColor = .darkGray
//        textField.backgroundColor = .lightGray
//        textField.borderStyle = .none
//        textField.returnKeyType = .next
//        textField.keyboardType = .default
//        textField.clearButtonMode = .always
//        self.addSubview(textField)

//
//        changeTextField.placeholder = "Status is  "
//        changeTextField.returnKeyType = .done
//        changeTextField.autocapitalizationType = .words
//        changeTextField.font = .systemFont(ofSize: 15)
//        changeTextField.textColor = .black
//        changeTextField.backgroundColor = .white
//        changeTextField.borderStyle = .line
//        changeTextField.returnKeyType = .next
//        changeTextField.keyboardType = .default
//        changeTextField.clearButtonMode = .always
//        changeTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingDidEnd)

//    }

    
//    @objc func buttonPressed() {
//        print ("Button pressed")
//        let txt = textField.text!
//        print(txt)
//        textField.text = statusText
//    }
//    @objc func statusTextChanged(_ sender: Any) {
//        statusText = changeTextField.text!
//    }


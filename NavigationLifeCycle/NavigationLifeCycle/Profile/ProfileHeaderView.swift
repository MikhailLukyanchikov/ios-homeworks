//
//  ProfileHeaderView.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 09.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
       }
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
    let textField = UITextField(frame: CGRect(x: 175, y: 210, width: 180, height: 30))
    let profileButton = UIButton(frame: CGRect(x: 55, y: 410, width: 300, height: 60))
    let changeTextField = UITextField(frame: CGRect(x: 175, y: 240, width: 180, height: 30))
    var statusText : String = ""

        private func setupView() {
        let profileImage = UIImage(named: "image")
        let profileImageView = UIImageView(image: profileImage)
        profileImageView.frame = CGRect(x: 16, y: 106, width: 150, height: 150)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 75
        self.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 106).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        profileImageView.layer.borderWidth = 3

        let viewLabel = UILabel(frame: CGRect(x: 175, y: 130, width: 180, height: 40))
        viewLabel.text = "NATURE"
        viewLabel.textColor = .black
        viewLabel.font = .systemFont(ofSize: 18, weight: .bold)
        self.addSubview(viewLabel)
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.heightAnchor.constraint(equalToConstant: 180).isActive = true
        viewLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        viewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 37).isActive = true
        viewLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 5).isActive = true
            
        let profileButton = UIButton(frame: CGRect(x: 16, y: 280, width: 360, height: 50))
        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileButton.setTitle("Show Status", for: .normal)
        profileButton.backgroundColor = .systemBlue
        profileButton.layer.cornerRadius = 22  //4 - не красиво
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowOpacity = 0.7
        profileButton.layer.shadowOpacity = 0.7
        self.addSubview(profileButton)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 36).isActive = true
        profileButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        profileButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
            
        textField.placeholder = "Waiting for something..."
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .darkGray
        textField.backgroundColor = .lightGray
        textField.borderStyle = .none
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 5).isActive = true
        textField.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -54).isActive = true
        
        changeTextField.placeholder = "Status is  "
        changeTextField.returnKeyType = .done
        changeTextField.autocapitalizationType = .words
        changeTextField.font = .systemFont(ofSize: 15)
        changeTextField.textColor = .black
        changeTextField.backgroundColor = .white
        changeTextField.borderStyle = .line
        changeTextField.returnKeyType = .next
        changeTextField.keyboardType = .default
        changeTextField.clearButtonMode = .always
        changeTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingDidEnd)
        self.addSubview(changeTextField)
        changeTextField.translatesAutoresizingMaskIntoConstraints = false
        changeTextField.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 5).isActive = true
        changeTextField.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -24).isActive = true
        changeTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -100).isActive = true
    }
    @objc func buttonPressed() {
        print ("Button pressed")
        let txt = textField.text!
        print(txt)
        textField.text = statusText
    }
    @objc func statusTextChanged(_ sender: Any) {
        statusText = changeTextField.text!
    }
}

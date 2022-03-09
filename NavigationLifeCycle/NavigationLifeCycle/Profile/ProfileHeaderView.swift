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
    //let avatar = UITextView(frame: CGRect(x: 200, y: 290, width: 190, height: 50))

       private func setupView() {

        let profileImage = UIImage(named: "image")
        let profileImageView = UIImageView(image: profileImage)
        profileImageView.frame = CGRect(x: 16, y: 116, width: 150, height: 150)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 75
        self.addSubview(profileImageView)
        
        let textField = UITextField(frame: CGRect(x: 175, y: 210, width: 180, height: 30))
        textField.placeholder = "Waiting for something..."
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .darkGray
        textField.backgroundColor = .lightGray
        textField.borderStyle = .none
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        self.addSubview(textField)
        
        let viewLabel = UILabel(frame: CGRect(x: 175, y: 130, width: 180, height: 40))
        viewLabel.text = "NATURE"
        viewLabel.font = .systemFont(ofSize: 20, weight: .light)
        self.addSubview(viewLabel)

        let profileButton = UIButton(frame: CGRect(x: 16, y: 280, width: 360, height: 50))
        profileButton.setTitle("Show Status", for: .normal)
        profileButton.backgroundColor = .systemBlue
        profileButton.layer.cornerRadius = 18
        self.addSubview(profileButton)
        
        
//           let profileImage = UIImage(named: "image")
//           let profileImageView = UIImageView(image: profileImage)
//           profileImageView.frame = CGRect(x: 35, y: 150, width: 150, height: 150)
//           self.addSubview(profileImageView)
        
//        avatar.backgroundColor = .red
//        self.addSubview(avatar)

       }

}

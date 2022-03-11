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
           let buttonPress = UITapGestureRecognizer(target: self, action: #selector(press(_ :)))
           self.addGestureRecognizer(buttonPress)
       }
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
    let textField = UITextField(frame: CGRect(x: 175, y: 210, width: 180, height: 30))
    let avatar = UITextView(frame: CGRect(x: 200, y: 290, width: 190, height: 50))
    let profileButton = UIButton(frame: CGRect(x: 55, y: 410, width: 300, height: 60))

        private func setupView() {

        let profileImage = UIImage(named: "image")
        let profileImageView = UIImageView(image: profileImage)
        profileImageView.frame = CGRect(x: 16, y: 116, width: 150, height: 150)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 75
        self.addSubview(profileImageView)
        
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
        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileButton.setTitle("Show Status", for: .normal)
        profileButton.backgroundColor = .systemBlue
        profileButton.layer.cornerRadius = 18
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowOpacity = 0.7
        self.addSubview(profileButton)
            
        
        
//           let profileImage = UIImage(named: "image")
//           let profileImageView = UIImageView(image: profileImage)
//           profileImageView.frame = CGRect(x: 35, y: 150, width: 150, height: 150)
//           self.addSubview(profileImageView)
        
//        avatar.backgroundColor = .red
//        self.addSubview(avatar)

       }
    
        @objc func buttonPressed() {
            print ("Button pressed")
            let txt = textField.text!
            print(txt)
        }

//    @objc func buttonPressed() {
//        print ("Button pressed")
//        avatar.text = textField.text
//        avatar.textColor = .black
//        UIView.animate(withDuration: 2.0) {
//            self.textField.text = ""
//            UIView.animate(withDuration: 1.0) {
//                self.profileButton.frame = CGRect(x: 55, y: 428, width: 300, height: 60)
//                self.textField.alpha = 1
//                self.endEditing(true)
//                if self.avatar.hasText {
//                    self.profileButton.setTitle("Change Status", for: .normal)
//                    self.textField.alpha = 0
//                    self.profileButton.frame = CGRect(x: 55, y: 400, width: 300, height: 60)
//                }
//            }
//        }
//    }
    @objc func press(_ sender: Any) {
            textField.resignFirstResponder()
        }

}

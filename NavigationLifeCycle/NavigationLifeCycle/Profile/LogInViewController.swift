import UIKit

class LogInViewController: UIViewController {
    
    let customColor = UIColor("#4885CC")
    let defaultPass = "12345678"
    let defaultLogin = "admin"
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.autoresizingMask = [.flexibleHeight]
        return scrollView
    }()
    
    private lazy var iconImage : UIImageView = {
        let image = UIImage(named: "logo")
        let nameLabel = UIImageView(image: image)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.layer.cornerRadius = 15
        return nameLabel
    }()
    
    private lazy var statusButton : UIButton = {
        var statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = customColor
        statusButton.layer.cornerRadius = 10
        statusButton.setTitle("Log In", for: .normal)
        statusButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        statusButton.backgroundImage(for: .application)
        return statusButton
    }()
    
    private lazy var textFieldLogin: UITextField = {
        let textField = UITextField()
        textField.isHidden = false
        textField.placeholder = "Email or phone "
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.borderStyle = .line
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.textAlignment = .left
        textField.tintColor = customColor
        return textField
    }()
    
    private lazy var textFieldPass: UITextField = {
        let textField = UITextField()
        textField.isHidden = false
        textField.placeholder = "Password  "
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.borderStyle = .line
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.textAlignment = .left
        textField.isSecureTextEntry = true
        textField.tintColor = customColor
        return textField
    }()
    
    private lazy var labelStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .green
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    private lazy var messageLabel : UILabel = {
       let label = UILabel()
        label.isHidden = true
        label.backgroundColor = .white
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //     setupNavBar()
        title = "Profile"
        self.view.backgroundColor = .white
        drawSelf()
    }
    deinit {
        viewDidDisappear(true)
    }
    private func setupNavBar() {
        self.navigationItem.title = "Login"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func drawSelf() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(messageLabel)
        self.scrollView.addSubview(self.labelStackView)
        self.scrollView.addSubview(self.statusButton)
        self.view.addSubview(self.iconImage)
        self.labelStackView.addArrangedSubview(self.textFieldLogin)
        self.labelStackView.addArrangedSubview(self.textFieldPass)
  
        NSLayoutConstraint.activate([self.scrollView.topAnchor.constraint(equalTo: self.iconImage.bottomAnchor),
                                     self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     
                                     self.iconImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
                                     self.iconImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     self.iconImage.heightAnchor.constraint(equalToConstant: 100),
                                     self.iconImage.widthAnchor.constraint(equalToConstant: 100),
                                     
                                     self.messageLabel.topAnchor.constraint(equalTo: self.statusButton.bottomAnchor,constant: 10),
                                     self.messageLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor,constant: 16),
                                     self.messageLabel.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
                                     self.messageLabel.widthAnchor.constraint(equalToConstant: 50),
                                     self.messageLabel.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     self.labelStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
                                     self.labelStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor,constant: 16),
                                     self.labelStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
                                     self.labelStackView.heightAnchor.constraint(equalToConstant: 100),
                                     self.labelStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -32),
                                     
                                     self.statusButton.topAnchor.constraint(equalTo: self.labelStackView.bottomAnchor, constant: 16),
                                     self.statusButton.leadingAnchor.constraint(equalTo: self.labelStackView.leadingAnchor),
                                     self.statusButton.heightAnchor.constraint(equalToConstant: 50),
                                     self.statusButton.trailingAnchor.constraint(equalTo: self.labelStackView.trailingAnchor),
                                     

        
        ])
            
        
    }
    @objc func buttonClicked() {
        self.textFieldPass.layer.borderColor = UIColor.lightGray.cgColor
        self.textFieldPass.layer.borderWidth = 0.5
        self.textFieldLogin.layer.borderColor = UIColor.lightGray.cgColor
        self.textFieldLogin.layer.borderWidth = 0.5
        self.messageLabel.text = ""
        messageLabel.isHidden = true
        statusButton.alpha = (statusButton.isSelected && !statusButton.isEnabled && statusButton.isHighlighted) ? 0.8 : 1
     /*  guard (!self.textFieldLogin.text!.isEmpty)  && (!self.textFieldPass.text!.isEmpty)
        else {
            if self.textFieldLogin.text!.isEmpty {
                self.messageLabel.text = "Login is Empty"
                self.scrollView.addSubview(messageLabel)
                messageLabel.isHidden = false
                self.textFieldLogin.layer.borderWidth = 3
                self.textFieldLogin.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
            }
            if self.textFieldPass.text!.isEmpty {
                self.messageLabel.text = "Password is Empty"
                self.textFieldPass.layer.borderWidth = 3
                self.textFieldPass.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
                messageLabel.isHidden = false
            }
            return
        }
        if self.textFieldPass.text!.count < 6 {
            self.messageLabel.text = "Password too easy, minimum count is 6 symbol"
            messageLabel.isHidden = false
            return
        }
        guard self.textFieldLogin.text == self.defaultLogin && self.textFieldPass.text == self.defaultPass else {
            if self.textFieldLogin.text != self.defaultLogin {
                let alert = UIAlertController(title: "Error", message: "Login Incorrect", preferredStyle: .alert)
                let buttonAllertYes = UIAlertAction(title: "Ok", style: .default, handler: .none)
                present(alert, animated: true, completion: nil)
                alert.addAction(buttonAllertYes)
                self.messageLabel.text = "Login incorrect, default is 'admin'"
                messageLabel.isHidden = false
            }
            if self.textFieldPass.text != self.defaultPass {
                let alert = UIAlertController(title: "Error", message: "Password Incorrect", preferredStyle: .alert)
                let buttonAllertYes = UIAlertAction(title: "Ok", style: .default, handler: .none)
                present(alert, animated: true, completion: nil)
                alert.addAction(buttonAllertYes)
                self.messageLabel.text = "Password incorrect, default is '12345678'"
                messageLabel.isHidden = false
            }
            return
        }  */
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height+15
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

}
extension UIColor {
  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000")
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }
}




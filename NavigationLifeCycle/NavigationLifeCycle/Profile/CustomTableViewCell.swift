//
//  CustomTableViewCell.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 30.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private lazy var _switch : UISwitch = {
        let _switch = UISwitch()
        _switch.isOn = true
        _switch.tintColor = .blue
        _switch.translatesAutoresizingMaskIntoConstraints = false
        return _switch
    }()
    private lazy var myImage: UIImageView = {
        let image = UIImage(named: "image")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style : UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(_switch)
        contentView.addSubview(myImage)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        _switch.frame = CGRect(x: 0, y: 0, width: 20, height: 90)
      
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([self.myImage.topAnchor.constraint(equalTo: self.contentView.topAnchor , constant: 30),
                                     self.myImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
                                     self.myImage.heightAnchor.constraint(equalToConstant: 100),
                                     self.myImage.widthAnchor.constraint(equalToConstant: 100)])
    }

}

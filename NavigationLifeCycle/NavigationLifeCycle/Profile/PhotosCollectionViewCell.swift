//
//  PhotosCollectionViewCell.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 03.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var myImages: UIImageView = {
        let image = UIImage(named: "foto1")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    let sizeFoto = (UIScreen.main.bounds.width - 32)/3
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(myImages)

    NSLayoutConstraint.activate([self.myImages.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
                                 self.myImages.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                                 self.myImages.widthAnchor.constraint(equalToConstant: sizeFoto),
                                 self.myImages.heightAnchor.constraint(equalToConstant: sizeFoto)])
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImages.image = nil
    }
    
    func setup(picture : UIImage) {
        self.myImages.image = picture
    }
        
}

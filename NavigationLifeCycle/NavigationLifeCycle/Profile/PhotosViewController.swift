//
//  PhotosViewController.swift
//  NavigationLifeCycle
//
//  Created by MIKHAIL on 03.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private enum Constants {
           static let itemCount: CGFloat = 3
       }
    
    var collection : [UIImage?] = [UIImage(named: "foto1"), UIImage(named: "foto2") , UIImage(named: "foto3") , UIImage(named: "foto4") , UIImage(named: "foto5") , UIImage(named: "foto6") , UIImage(named: "foto7") , UIImage(named: "foto8"), UIImage(named: "foto9") , UIImage(named: "foto10") , UIImage(named: "foto11") , UIImage(named: "foto12") , UIImage(named: "foto13") , UIImage(named: "foto14") , UIImage(named: "foto15") , UIImage(named: "foto16") , UIImage(named: "foto17") , UIImage(named: "foto18") , UIImage(named: "foto19") , UIImage(named: "foto20")]
       
       private lazy var layout: UICollectionViewFlowLayout = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .vertical
           layout.minimumInteritemSpacing = 8
           layout.minimumLineSpacing = 8
           return layout
       }()
       
       private lazy var collectionView: UICollectionView = {
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
           collectionView.backgroundColor = .white
           collectionView.dataSource = self
           collectionView.delegate = self
           collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
           collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           return collectionView
       }()

       override func viewDidLoad() {
            super.viewDidLoad()
            setupNavBar()
            self.view.backgroundColor = .white
            self.view.addSubview(self.collectionView)
           
           let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8)
           let leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 8)
           let rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -8)
           let bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
           
           NSLayoutConstraint.activate([
               topConstraint, leftConstraint, rightConstraint, bottomConstraint
           ])
       }
    private func setupNavBar() {
        self.navigationItem.title = "Photo Gallery"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
       
       private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
           let neededWidth = width - 2 * spacing
           let itemWidth = floor(neededWidth / Constants.itemCount)
           return CGSize(width: itemWidth, height: itemWidth)
       }
   }

   extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 20
       }
    
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? PhotosCollectionViewCell else {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
               return cell
           }
           cell.setup(picture: ((collection[indexPath.row] ?? UIImage(named: "sport1"))!))
           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
           return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
       }
}

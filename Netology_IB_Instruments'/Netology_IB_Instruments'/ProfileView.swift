//
//  ProfileView.swift
//  Netology_IB_Instruments'
//
//  Created by MIKHAIL on 11.02.2022.
//

import UIKit

@IBDesignable class ProfileView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateBurnLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var someTextView: UITextView!
    
    
    var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ProfileView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

}


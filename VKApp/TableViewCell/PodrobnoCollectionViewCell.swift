//
//  PodrobnoCollectionViewCell.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

class PodrobnoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userDetailImageView: UIImageView!
    @IBOutlet weak var shadowView: CustomImage!
    
    static let id = "PodrobnoCollectionViewCell"
    
    @IBInspectable var shadowOpacity: CGFloat = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 75 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowColor: CGColor = UIColor.red.cgColor {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private func updateShadowOpacity() {
        userDetailImageView.layer.shadowOpacity = Float(shadowOpacity)
        userDetailImageView.layer.shadowRadius = shadowRadius
        userDetailImageView.layer.shadowColor = shadowColor
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        userDetailImageView.clipsToBounds = true
        userDetailImageView.layer.masksToBounds = true
        userDetailImageView.layer.cornerRadius = 75
        applyshadowWithCorner(containerView: backView, cornerRadious: 75)
        updateShadowOpacity()
    }

    static func nib() -> UINib {
        let inibLocal = UINib(nibName: "PodrobnoCollectionViewCell", bundle: nil)
        
        return inibLocal
    }
    
    public func configure(model: Users) {
        userNameLabel.text = model.name
        userDetailImageView.image = UIImage(named: model.userImage)
    }
}

extension PodrobnoCollectionViewCell {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.red.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 20
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}

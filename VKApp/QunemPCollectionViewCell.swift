//
//  QunemPCollectionViewCell.swift
//  VKApp
//
//  Created by Artur Gedakyan on 25.03.2021.
//

import UIKit

class QunemPCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    static let id = "QunemPCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    static func nib() -> UINib {
        let inibLocal = UINib(nibName: "QunemPCollectionViewCell", bundle: nil)
        
        return inibLocal
    }

}

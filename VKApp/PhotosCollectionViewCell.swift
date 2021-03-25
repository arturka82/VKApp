//
//  PhotosCollectionViewCell.swift
//  VKApp
//
//  Created by Artur Gedakyan on 25.03.2021.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    
    static let id = "PhotosCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.image = UIImage(named: "Евгений")
    }
    
    static func nib() -> UINib {
        let inibLocal = UINib(nibName: "PhotosCollectionViewCell", bundle: nil)
        
        return inibLocal
    }
}

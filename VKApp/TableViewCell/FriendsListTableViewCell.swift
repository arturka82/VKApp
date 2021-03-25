//
//  FriendsListTableViewCell.swift
//  VKApp
//
//  Created by Artur Gedakyan on 17.03.2021.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    static let id = "FriendsListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImageView.layer.cornerRadius = 25
        userImageView.layer.shadowColor = CGColor(red: 255, green: 5, blue: 5, alpha: 1)
        userImageView.layer.shadowRadius = 20
        userImageView.layer.shadowOpacity = 1
        userImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        UINib(nibName: "FriendsListTableViewCell", bundle: nil)
    }
    
    public func configure(model: Users) {
        userNameLabel.text = model.name
        userImageView.image = UIImage(named: model.userImage)
    }
    
}

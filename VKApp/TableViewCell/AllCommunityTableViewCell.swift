//
//  AllCommunityTableViewCell.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

class AllCommunityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var communityImageView: UIImageView!
    @IBOutlet weak var communityNameLabel: UILabel!
    @IBOutlet weak var communitySubLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(model: Community) {
        communityNameLabel.text = model.name
        communityImageView.image = UIImage(named: model.userImage)
        communitySubLabel.text = model.subsctiber
    }
}

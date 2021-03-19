//
//  PostTableViewCell.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var smallImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var postNameLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    static let id = "PostTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib {
        UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
    
    func configure(model: Post) {
        postNameLabel.text = model.postName
        likeCountLabel.text = model.likeCount
        smallImageView.image = UIImage(named:model.smallImageUser)
        mainImageView.image = UIImage(named: model.nameImageView)
    }
}


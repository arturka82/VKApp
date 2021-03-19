//
//  LikeControll.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

@IBDesignable final class LikesControl: UIControl {
    
    var flag = true
    
    private var stackView = UIStackView()
    private var likeImageView = UIImageView()
    private var likesCount = 5
    private var likeCountLablel = UILabel()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
        stackView.frame = bounds
    }
    
    
    func setLikes(likesCount: Int) {
        self.likesCount = likesCount
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        likeImageView.image = UIImage(systemName: "heart")
        likeImageView.tintColor = .gray
        likeImageView.contentMode = .scaleAspectFill
        likeCountLablel.text = String(likesCount)
        likeCountLablel.font = UIFont(name: "Bold", size: 20)
        likeCountLablel.textColor = .gray
        
        stackView = UIStackView(arrangedSubviews: [likeImageView, likeCountLablel])
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        addSubview(stackView)
    }
    
    func likeSelect() {
        if flag {
            likeImageView.image = UIImage(systemName: "heart.fill")
            likeImageView.tintColor = .red
            likeCountLablel.textColor = .red
            likesCount += 1
        } else {
            likeImageView.image = UIImage(systemName: "heart")
            likeImageView.tintColor = .gray
            likeCountLablel.textColor = .gray
            likesCount -= 1
        }
        flag.toggle()
        print(likesCount)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        likeSelect()
        likeCountLablel.text = String(likesCount)

    }
}

//
//  LikeControll.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

/// LikesControl
@IBDesignable final class LikesControl: UIControl {
    
    // MARK: - Private Properties
    private var flag = true
    private var stackView = UIStackView()
    private var likeImageView = UIImageView()
    private var likesCount = 5
    private var likeCountLablel = UILabel()
    
    let congig = UIImage.SymbolConfiguration(pointSize: 25)
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Public methods
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
        stackView.frame = bounds
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        likeSelect()
        likeCountLablel.text = String(likesCount)
    }
    
    // MARK: - Private Methods
    private func setLikes(likesCount: Int) {
        self.likesCount = likesCount
    }
    
    private func setupView() {
        
        likeImageView.image = UIImage(systemName: "heart",withConfiguration: congig)
        likeImageView.tintColor = .gray
        likeImageView.contentMode = .scaleToFill
        likeCountLablel.text = String(likesCount)
        likeCountLablel.font = UIFont(name: likeCountLablel.font.fontName, size: 20)
        likeCountLablel.textColor = .gray
        
        stackView = UIStackView(arrangedSubviews: [likeImageView, likeCountLablel])
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        addSubview(stackView)
    }
    
    // MARK: - Private Methods
    private func likeSelect() {
        if flag {
            likeImageView.image = UIImage(systemName: "heart.fill", withConfiguration: congig)
            likeImageView.tintColor = .red
            likeCountLablel.textColor = .red
            likesCount += 1
        } else {
            likeImageView.image = UIImage(systemName: "heart", withConfiguration: congig)
            likeImageView.tintColor = .gray
            likeCountLablel.textColor = .gray
            likesCount -= 1
        }
        flag.toggle()
        print(likesCount)
        showImage()
    }
    
    private func showImage() {
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut) {
            self.likeImageView.transform = CGAffineTransform(rotationAngle: 360)
        }
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.likeImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
        
        UIView.animate(withDuration: 1, delay: 1.5, options: .curveEaseOut) {
            self.likeImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}

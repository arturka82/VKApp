//
//  CustomImage.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

/// CustomImage
final class CustomImage: UIImageView {
   
    // MARK: - IBInspectable
    @IBInspectable var shadowOpacity: CGFloat = 1 {
        didSet {
            updateShadowOpacity()
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 75 {
        didSet {
            updateShadowRadius()
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowColor: CGColor = UIColor.red.cgColor {
        didSet {
            updateShadowOpacity()
            setNeedsDisplay()
        }
    }
    
    // MARK: - Private Methods
    private func updateShadowOpacity() {
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor
    }

    private func updateShadowRadius() {
        layer.shadowRadius = shadowRadius
    }
}

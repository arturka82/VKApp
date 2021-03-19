//
//  CustomImage.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

class CustomImage: UIImageView {
   
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
    
    
    
    override func draw(_ rect: CGRect) {
        
    }
    
    private func updateShadowOpacity() {
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor
    }

    private func updateShadowRadius() {
        layer.shadowRadius = shadowRadius
    }
}

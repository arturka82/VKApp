//
//  AnimationViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 23.03.2021.
//

import UIKit

final class AnimationViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTitle()

    }
    
    @IBAction private func showImage(_ sender: Any) {
        UIView.animate(withDuration: 3, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        })
        
        UIView.animate(withDuration: 1, delay: 1.5, options: .curveEaseInOut) {
            self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    private func animateTitle() {

        UIView.animate(withDuration: 1, delay: 0.5, options: [.repeat, .autoreverse]) {
            self.view1.alpha = 0
        } completion: { (_) in
            self.view1.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 1, options: [.repeat, .autoreverse]) {
            self.view2.alpha = 0
        } completion: { (_) in
            self.view2.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 1.5, options: [.repeat, .autoreverse]) {
            self.view3.alpha = 0
        } completion: { (_) in
            self.view3.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut) {
            self.view1.transform = .identity
            self.view1.transform = .identity
            self.view3.transform = .identity
        }
    }
}

//
//  VerticalControl.swift
//  VKApp
//
//  Created by Artur Gedakyan on 19.03.2021.
//

import UIKit

/// VerticalControl
final class VerticalControl: UIControl {
    
    // MARK: - Private Properties
    private var firstButton = UIButton()
    private var secondButton = UIButton()
    private var thirdButton = UIButton()
    private var fourButton = UIButton()
    private var fiveButton = UIButton()
    private var stackView =  UIStackView()
    
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
    
    func setupView() {
        firstButton.setTitle("Е", for: .normal)
        firstButton.setTitleColor(.black, for: .normal)
        firstButton.setTitleColor(.red, for: .highlighted)
        firstButton.addTarget(nil, action: #selector(test), for: .touchUpInside)
        
        secondButton.setTitle("М", for: .normal)
        secondButton.setTitleColor(.black, for: .normal)
        secondButton.setTitleColor(.red, for: .highlighted)
        secondButton.addTarget(nil, action: #selector(test), for: .touchUpInside)
        
        thirdButton.setTitle("В", for: .normal)
        thirdButton.setTitleColor(.black, for: .normal)
        thirdButton.setTitleColor(.red, for: .highlighted)
        secondButton.addTarget(nil, action: #selector(test), for: .touchUpInside)
        
        fourButton.setTitle("Б", for: .normal)
        fourButton.setTitleColor(.black, for: .normal)
        fourButton.setTitleColor(.red, for: .highlighted)
        fourButton.addTarget(nil, action: #selector(test), for: .touchUpInside)
        
        stackView = UIStackView(arrangedSubviews: [firstButton, secondButton, thirdButton, fourButton])
        stackView.spacing = 30
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        
        addSubview(stackView)
    }
    
    @objc private func test() {
        print("kk")
    }
}


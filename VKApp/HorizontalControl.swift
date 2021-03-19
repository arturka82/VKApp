//
//  HorizontalControl.swift
//  VKApp
//
//  Created by Artur Gedakyan on 19.03.2021.
//

import UIKit

/// HorizontalControl
 class HorizontalControl: UIControl {
    
    private var firstButton = UIButton()
    private var secondButton = UIButton()
    private var thirdButton = UIButton()
    private var fourButton = UIButton()
    private var fiveButton = UIButton()

    private var buttons: [UIButton] = []
    private var stackView =  UIStackView()
    
    override func draw(_ rect: CGRect) {

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }

    func setupView() {
        firstButton.setTitle("Е", for: .normal)
        firstButton.setTitleColor(.blue, for: .normal)
        firstButton.setTitleColor(.red, for: .highlighted)
        firstButton.addTarget(nil, action: #selector(test), for: .touchUpInside)
        
        secondButton.setTitle("М", for: .normal)
        secondButton.setTitleColor(.blue, for: .normal)
        secondButton.setTitleColor(.red, for: .highlighted)
        secondButton.addTarget(nil, action: #selector(test), for: .touchUpInside)

        thirdButton.setTitle("В", for: .normal)
        thirdButton.setTitleColor(.blue, for: .normal)
        thirdButton.setTitleColor(.red, for: .highlighted)
        secondButton.addTarget(nil, action: #selector(test), for: .touchUpInside)

        fourButton.setTitle("Б", for: .normal)
        fourButton.setTitleColor(.blue, for: .normal)
        fourButton.setTitleColor(.red, for: .highlighted)
        fourButton.addTarget(nil, action: #selector(test), for: .touchUpInside)
        
        addSubview(stackView)
        
        stackView = UIStackView(arrangedSubviews: [firstButton, secondButton, thirdButton, fourButton])
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    

    @objc private func test() {
        print("kk")
    }
}






/*
 private func setupView() {
     for dau in ​Day​chik.allDays {
         let button = UIButton(type: .system)
         button.setTitle("DD", for: .normal)
         button.setTitleColor(.blue, for: .normal)
         button.setTitleColor(.red, for: .selected)

         button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
         buttons.append(button)
     }
     
     stackView = UIStackView(arrangedSubviews: self.buttons)
     
     addSubview(stackView)
     
     stackView.spacing = 10
     stackView.axis = .horizontal
     stackView.alignment = .center
     stackView.distribution = .fillEqually
 }
     
     private func updateSelectedDay() {
         for (index, button) in buttons.enumerated() {
             guard let day = ​Day​chik(rawValue: index) else { continue }
             button.isSelected = day == selectedDay
         }
     }
     @objc private func selectDay(_ sender: UIButton) {
         guard let index = buttons.index(of: sender) else {
             return
         }
         guard let day = ​Day​chik(rawValue: index) else {
             return
         }
         selectedDay = day
     }

 
 var selectedDay: ​Day​chik? = nil {
     didSet {
         updateSelectedDay()
         sendActions(for: .valueChanged)
     }
 }
 
 /// ​Day​ enum
 enum ​Day​chik: Int {
     case monday, tuesday, wednesday, thursday, friday, saturday, sunday
     
     static let allDays: [​Day​chik] = [monday, tuesday, wednesday, thursday, friday, saturday , sunday]
     
     var title: String {
         switch self {
         case .monday:
             return "a"
         case .tuesday:
             return "a"
         case .wednesday:
             return "a"
         case .thursday:
             return "a"
         case .friday:
             return "a"
         case .saturday:
             return "a"
         case .sunday:
             return "a"
         }
     }
 }
 */

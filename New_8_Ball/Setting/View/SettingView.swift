//
//  SettingView.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 21.02.2022.
//

import UIKit

final class SettingView: UIView{
    
    let label = UILabel()
    let answerField = UITextField()
    let buttonToSave = UIButton()
    
    override init (frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = .white
        createViews()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createViews(){
        
        let view = UIView()
        view.backgroundColor = .white
                
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = .white
        label.text = "Enter your hard Answer"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = UIColor.lightGray
        self.addSubview(label)
        
        answerField.translatesAutoresizingMaskIntoConstraints = false
        answerField.textAlignment = .center
        answerField.backgroundColor = .lightGray
        answerField.textColor = .white
        answerField.font = UIFont.systemFont(ofSize: 24.0)
        self.addSubview(answerField)
                
        buttonToSave.translatesAutoresizingMaskIntoConstraints = false
        buttonToSave.setTitle("Save", for: .normal)
        buttonToSave.backgroundColor = .systemBlue
        buttonToSave.layer.cornerRadius = 5.0
        self.addSubview(buttonToSave)
                
        // Задання розміщення елементів та задання мінімальних обмежень
                
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 300.0),
            label.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 20.0),
                
            answerField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5.0),
            answerField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 20.0),
            answerField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20.0),
                
            buttonToSave.topAnchor.constraint(equalTo: answerField.layoutMarginsGuide.topAnchor, constant: 40.0),
            buttonToSave.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -80.0),
            buttonToSave.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 80.0)
        ])
        
    }
    
}

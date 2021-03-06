//
//  MainView.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 21.02.2022.
//

import UIKit

final class MainView: UIView{
    
    let image = UIImageView()
    let label = UILabel()
    let labelUnderField = UILabel()
    let labelUnderField2 = UILabel()
    let textField = UITextField()
    let getAnswer = UIButton()
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       self.backgroundColor = .white
       createSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Створення та задання параметрів для елеметнів інтерфейсу
    func createSubViews(){
        
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.image = UIImage(named: "8ball")
        self.addSubview(image)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.lightGray
        label.layer.cornerRadius = 3.0
        label.text = "Shake to take your answer"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textColor = .white
        self.addSubview(label)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 20.0)
        self.addSubview(textField)
        
        labelUnderField.translatesAutoresizingMaskIntoConstraints = false
        labelUnderField.textAlignment = .left
        labelUnderField.text = "If you do not receive an answer after shaking, press the button twice"
        labelUnderField.numberOfLines = 0
        labelUnderField.font = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
        self.addSubview(labelUnderField)
        
        labelUnderField2.translatesAutoresizingMaskIntoConstraints = false
        labelUnderField2.textAlignment = .left
        labelUnderField2.text = "Enter your question"
        labelUnderField2.textColor = UIColor.lightGray
        labelUnderField2.numberOfLines = 0
        labelUnderField2.font = UIFont.systemFont(ofSize:16.0)
        self.addSubview(labelUnderField2)
        
        getAnswer.translatesAutoresizingMaskIntoConstraints = false
        getAnswer.setTitle("Get Answer", for: .normal)
        getAnswer.layer.cornerRadius = 5.0
        getAnswer.backgroundColor = .systemBlue
        self.addSubview(getAnswer)
        
        // Задання розміщення елементів та задання мінімальних обмежень
        NSLayoutConstraint.activate([
        
            image.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20.0),
            image.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -45.0),
            image.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 45.0),
            
            labelUnderField2.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 60.0),
            labelUnderField2.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            labelUnderField2.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 20.0),

            textField.topAnchor.constraint(equalTo: labelUnderField2.bottomAnchor, constant: 10.0),
            textField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            textField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 20),
            
            label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20.0),
            label.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 20.0),
            
            labelUnderField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5.0),
            labelUnderField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            labelUnderField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 20.0),
             
            getAnswer.topAnchor.constraint(equalTo: labelUnderField.bottomAnchor, constant: 60.0),
            getAnswer.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -80.0),
            getAnswer.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 80.0)
            
        ])
    }
}

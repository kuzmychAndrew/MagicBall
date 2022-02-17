//
//  ViewController.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var image:UIImageView!
    var label:UILabel!
    var labelUnderField: UILabel!
    var labelUnderField2: UILabel!
    var textField: UITextField!
    var getAnswer: UIButton!
    
    
        // Ініціалізуємо зовніщні сервіси
    private var mainViewModel = MainViewModel()
    private var jsonServoce = JSONService()
    
        // Допоміжні методи для виклику потрібих функцій
    func printRealmAnswer(){
        mainViewModel.fetchHardAnwer()
        bindRealmAnswer()
    }
    func printJsonAnswer(){
        mainViewModel.fetchAnswer()
        bindJsonAnswer()
    }
    // Звязуємо отриманя дані з Label в головному потоці
    func bindRealmAnswer(){
        mainViewModel.realmAnswer.bind({(realmAnswer)in
            DispatchQueue.main.async {
                print(realmAnswer)
                self.label.text = realmAnswer
            }
        })
    }
    func bindJsonAnswer(){
        
        mainViewModel.jsonAnswer.bind({(jsonAnswer)in
           DispatchQueue.main.async {
                print(jsonAnswer)
               self.label.text = jsonAnswer
        }
        })
        
        
    }
    // Метод для виклику після натискання кнопки
    @objc func answer(sender: UIButton){
        printRealmAnswer()
    }
    
        
    
    // Мотоди для виклику після струсу
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        label.text = "load"
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        printJsonAnswer()
        
        textField.text = ""
    }
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    // Створення та задання параметрів для елеметнів інтерфейсу
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = .white
        
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.image = UIImage(named: "8ball")
        view.addSubview(image)
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.lightGray
        label.layer.cornerRadius = 3
        label.text = "Shake to take your answer"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        view.addSubview(label)
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(textField)
        
        labelUnderField = UILabel()
        labelUnderField.translatesAutoresizingMaskIntoConstraints = false
        labelUnderField.textAlignment = .left
        labelUnderField.text = "If you do not receive an answer after shaking, press the button twice"
        labelUnderField.numberOfLines = 0
        labelUnderField.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        view.addSubview(labelUnderField)
        
        labelUnderField2 = UILabel()
        labelUnderField2.translatesAutoresizingMaskIntoConstraints = false
        labelUnderField2.textAlignment = .left
        labelUnderField2.text = "Enter your question"
        labelUnderField2.textColor = UIColor.lightGray
        labelUnderField2.numberOfLines = 0
        labelUnderField2.font = UIFont.systemFont(ofSize:16)
        view.addSubview(labelUnderField2)
        
       getAnswer = UIButton()
        getAnswer.translatesAutoresizingMaskIntoConstraints = false
       
        getAnswer.setTitle("Get Answer", for: .normal)
        getAnswer.layer.cornerRadius = 5
        getAnswer.backgroundColor = .systemBlue
        getAnswer.addTarget(self, action: #selector(answer), for: .touchUpInside)
        view.addSubview(getAnswer)
        
        
        
        
    // Задання розміщення елементів та задання мінімальних обмежень
        NSLayoutConstraint.activate([
        
            image.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -45),
            image.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +45),
            
           
            
            labelUnderField2.topAnchor.constraint(equalTo: image.bottomAnchor, constant: +60),
            labelUnderField2.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            labelUnderField2.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20),

            
            textField.topAnchor.constraint(equalTo: labelUnderField2.bottomAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            textField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20),
            
           
            
            label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: +20),
            label.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20),
            
            labelUnderField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: +5),
            labelUnderField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            labelUnderField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20),
             
            getAnswer.topAnchor.constraint(equalTo: labelUnderField.bottomAnchor, constant: 60),
            getAnswer.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -80),
            getAnswer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +80),
            
            
        ])
        
    }
}

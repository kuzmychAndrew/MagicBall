//
//  SettingViewController.swift
//  8-ball
//
//  Created by Андрій Кузьмич on 18.10.2021.
//

import UIKit


class SettingViewController: UIViewController{
    
    var answerField: UITextField!
    var saveB: UIButton!
    
    // Ініціалізуємо зовніщні сервіси
    private var realmService = RealmService()
    private var svm = SettingViewModel()
    
// Метод для виклику після натискання кнопки, отримання даних з TextField та передачі даниз в ViewModel
    @objc func save(sender: UIButton){
        guard let currentAnswer = answerField.text else{return}
        svm.writeHardAnswer(answer: currentAnswer)

       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Створення та задання параметрів для елеметнів інтерфейсу
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        answerField = UITextField()
        answerField.translatesAutoresizingMaskIntoConstraints = false
        answerField.textAlignment = .center
        answerField.backgroundColor = .lightGray
        answerField.textColor = .white
        answerField.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(answerField)
        
        saveB = UIButton()
        saveB.translatesAutoresizingMaskIntoConstraints = false
        saveB.setTitle("Save", for: .normal)
        saveB.backgroundColor = UIColor.lightGray
        saveB.addTarget(self, action: #selector(save), for: .touchUpInside)
        view.addSubview(saveB)
        
        // Задання розміщення елементів та задання мінімальних обмежень
        
        NSLayoutConstraint.activate([
            answerField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: +300),
            answerField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20),
            answerField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
        
            saveB.topAnchor.constraint(equalTo: answerField.layoutMarginsGuide.topAnchor, constant: +40),
            saveB.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            saveB.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20)
            

        
        ])
    }
    
    
}

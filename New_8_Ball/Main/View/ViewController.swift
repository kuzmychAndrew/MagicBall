//
//  ViewController.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import UIKit
final class MainViewController: UIViewController {
    
    // Ініціалізуємо зовніщні сервіси
    private var mainViewModel = ViewModelBilder.createMainModule()
    private var mainView: MainView {return view as! MainView}
    
    // Створення та задання параметрів для елеметнів інтерфейсу
    override func loadView() {
    
        self.view = MainView(frame: UIScreen.main.bounds)
        mainView.getAnswer.addTarget(self, action: #selector(answer), for: .touchUpInside)
    }

    // Метод для виклику після натискання кнопки
    @objc func answer(sender: UIButton){
        
        printRealmAnswer()
    }

        // Допоміжні методи для виклику потрібих функцій
    func printRealmAnswer(){
        
        mainViewModel.getRealmAnswer()
        bindRealmAnswer()
    }
    
    func printJsonAnswer(){
        
        mainViewModel.getJSONAnswer()
        bindJsonAnswer()
    }
    
    // Звязуємо отриманя дані з Label в головному потоці
    func bindRealmAnswer(){
        
        mainViewModel.realmAnswer.bind({(realmAnswer)in
            DispatchQueue.main.async {
                print(realmAnswer)
                self.mainView.label.text = realmAnswer
            }
        })
    }
    
    func bindJsonAnswer(){
        
        mainViewModel.jsonAnswer.bind({(jsonAnswer)in
           DispatchQueue.main.async {
               print(jsonAnswer)
               self.mainView.label.text = jsonAnswer
               
           }
        })
    }
    
    // Мотоди для виклику після струсу
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        mainView.label.text = "load"
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        printJsonAnswer()
        
        mainView.textField.text = ""
    }
        
    

    
}

//
//  SettingViewController.swift
//  8-ball
//
//  Created by Андрій Кузьмич on 18.10.2021.
//

import UIKit


final class SettingViewController: UIViewController{
   
    // Ініціалізуємо зовніщні сервіси
    private var settingViewController = ViewModelBilder.createSettingModule()
    private var settingView: SettingView{return view as! SettingView}
        
    override func loadView() {
        view = SettingView(frame: UIScreen.main.bounds)
        settingView.buttonToSave.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
    
// Метод для виклику після натискання кнопки, отримання даних з TextField та передачі даниз в ViewModel
    @objc func save(sender: UIButton){
        if settingView.answerField.text == ""{
            let errorAlert = UIAlertController(title: "Error", message: "The field cannot be empty", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            self.present(errorAlert, animated: true, completion: nil)
        }else{
            guard let currentAnswer = settingView.answerField.text else{return}
            settingViewController.writeAnswer(answer: currentAnswer)
            settingView.answerField.text = ""
        }
    }
}


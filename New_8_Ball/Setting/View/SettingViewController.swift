//
//  SettingViewController.swift
//  8-ball
//
//  Created by Андрій Кузьмич on 18.10.2021.
//

import UIKit


final class SettingViewController: UIViewController{
    
   
    
    // Ініціалізуємо зовніщні сервіси
    
    private var svm = ViewModelBilder.createSettingModule()
    var settingView: SettingView{return self.view as! SettingView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = SettingView(frame: UIScreen.main.bounds)
            settingView.saveB.addTarget(self, action: #selector(save), for: .touchUpInside)

    }
    
    
// Метод для виклику після натискання кнопки, отримання даних з TextField та передачі даниз в ViewModel
    @objc func save(sender: UIButton){
        if settingView.answerField.text == ""{
            let ac = UIAlertController(title: "Error", message: "The field cannot be empty", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
            self.present(ac, animated: true, completion: nil)
        
        }else{
            guard let currentAnswer = settingView.answerField.text else{return}
            svm.writeAnswer(answer: currentAnswer)
                settingView.answerField.text = ""
        }

       
    }
    
   
    
}


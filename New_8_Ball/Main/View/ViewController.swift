//
//  ViewController.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import UIKit
final class MainViewController: UIViewController {

        // Ініціалізуємо зовніщні сервіси
    var mainViewModel = ViewModelBilder.createMainModule()
    // swiftlint:disable force_cast
    var mainView: MainView {return  view as! MainView}
    // swiftlint:enable force_cast
   
    override func viewDidLoad() {
        super.viewDidLoad()
            }

    // Створення та задання параметрів для елеметнів інтерфейсу
    override func loadView() {
        view = MainView(frame: UIScreen.main.bounds)
            mainView.getAnswer.addTarget(self, action: #selector(answer), for: .touchUpInside)
    }

    // Метод для виклику після натискання кнопки
    @objc func answer(sender: UIButton) {
        printRealmAnswer()
    }

        // Допоміжні методи для виклику потрібих функцій
    func printRealmAnswer() {
        mainViewModel.fetchHardAnswer()
        bindRealmAnswer()
    }
    func printJsonAnswer() {
        mainViewModel.fetchRealmAnswer()
        bindJsonAnswer()
    }
    // Звязуємо отриманя дані з Label в головному потоці
    func bindRealmAnswer() {
        mainViewModel.realmAnswer.bind({(realmAnswer)in
            DispatchQueue.main.async {
                print(realmAnswer)
                self.mainView.label.text = realmAnswer
            }
        })
    }
    func bindJsonAnswer() {

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

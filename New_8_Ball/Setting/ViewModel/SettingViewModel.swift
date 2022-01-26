//
//  SettingViewModel.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation
class SettingViewModel{
    //Ініціалізуємо зовнішні сервіси
    private var realmService = RealmService()
    var hardAnswer = Dynamic("")
     
    
        //Отримання даних з View та передача даних в зовнішній ресурс
    
    func writeHardAnswer(answer: String){
        realmService.writeHardAnswer(answer: answer)
    }
}

//
//  MainViewModel.swift.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation
class MainViewModel{
    
    //Ініціалізуємо зовнішні сервіси

    private let jsonService = JSONService()
    private let realmService = RealmService()
    
   
    var jsonAnswer = Dynamic("")
    var realmAnswer = Dynamic("")
    var empData: Answers!
    
    
    // Отримуємо необхідні дані з зовнішніх сервісів
    final func fetchHardAnwer(){
        print("fetchHardAnwer")
        self.realmService.getingRealmAnswer {(answer) in
            self.realmAnswer.value = answer
            print("mainViewModel - \(answer)")
        }
    }
    
    
    final func fetchAnswer(){
        self.jsonService.getingJSONAnswer {(empData) in
            self.empData = empData
            self.jsonAnswer.value = empData.magic.answer
        }
    }

    
    
}



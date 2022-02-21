//
//  MainViewModel.swift.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation




 
final class MainViewModel{
    
    
    
    //Ініціалізуємо зовнішні сервіси

    private let jsonService: jsonServiceProtocol
    private let realmService: realmServiceProtocol
    init (jsonService: jsonServiceProtocol, realmService: realmServiceProtocol){
        self.jsonService = jsonService
        self.realmService = realmService

    }
    
   
    var jsonAnswer = Dynamic("")
    var realmAnswer = Dynamic("")
    var empData: Answers!
    
    
    // Отримуємо необхідні дані з зовнішніх сервісів
    func fetchHardAnswer(){
        print("fetchHardAnwer")
        self.realmService.getingRealmAnswer {(answer) in
            self.realmAnswer.value = answer
            print("mainViewModel - \(answer)")
        }
    }
    
    
    func fetchRealmAnswer(){
        self.jsonService.getingJSONAnswer {(empData) in
            self.empData = empData
            self.jsonAnswer.value = empData.magic.answer
        }
    }

    
    
}



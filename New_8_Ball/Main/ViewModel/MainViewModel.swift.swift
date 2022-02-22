//
//  MainViewModel.swift.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation

final class MainViewModel{

    //Ініціалізуємо зовнішні сервіси
    private let jsonService: JSONServiceProtocol
    private let realmService: RealmServiceProtocol
    
    init (jsonService: JSONServiceProtocol, realmService: RealmServiceProtocol){
        
        self.jsonService = jsonService
        self.realmService = realmService
    }
    
    public var jsonAnswer = Dynamic("")
    public var realmAnswer = Dynamic("")
    private var empData: Answers!
    
    // Отримуємо необхідні дані з зовнішніх сервісів
    func getRealmAnswer(){
        print("fetchHardAnwer")
        self.realmService.getingRealmAnswer {(answer) in
            self.realmAnswer.value = answer
            print("mainViewModel - \(answer)")
        }
    }
    
    func getJSONAnswer(){
        self.jsonService.getingJSONAnswer {(empData) in
            self.empData = empData
            self.jsonAnswer.value = empData.magic.answer
        }
    }
}



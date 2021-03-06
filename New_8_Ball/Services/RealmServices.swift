//
//  RealmServices.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol{
    func getingRealmAnswer(compeltion: @escaping (String) ->())
    func writingRealmAnswer(answer: String)
}

final class RealmService: RealmServiceProtocol{
    
    private let realm: Realm = try! Realm()
    private var answers = try! Realm().objects(HardAnswer.self)
    
    //Метод для отримання hardAnswer з бази даних
    func getingRealmAnswer(compeltion: @escaping (String) ->()){
        
        let randAnswer = self.answers.randomElement()
        guard let answer = randAnswer?.answer else{return}
        compeltion(answer)
        print(answer)
    }
    
    // Метод для запису hardAnswer в базу даних
    func writingRealmAnswer(answer: String){
        let currentAnswer = answer
        let newAnswer = HardAnswer(answer: currentAnswer)
        try! self.realm.write{
            self.realm.add(newAnswer)
        }
        let path = realm.configuration.fileURL?.path
        print("Path: \(String(describing: path))")
    }
}

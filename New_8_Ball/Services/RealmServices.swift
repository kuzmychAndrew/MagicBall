//
//  RealmServices.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation
import RealmSwift

protocol realmServiceProtocol {
    func getingRealmAnswer(compeltion: @escaping (String) -> Void)
    func writingRealmAnswer(answer: String)
}
final class RealmService: realmServiceProtocol {
    
//    static var realm: Realm = try! Realm()

    var realm: Realm {
        get {
            do {
                let realm = try Realm()
                return realm
                } catch {
                    print("Could not access database: ", error)
                }
                return self.realm
            }
        }
    
    // Метод для отримання hardAnswer з бази даних
    func getingRealmAnswer(compeltion: @escaping (String) -> Void) {
        
        do {
            let answers = try Realm().objects(HardAnswer.self)
            let randAnswer = answers.randomElement()
            guard let answer = randAnswer?.answer else {return}
            compeltion(answer)
            print(answer)
        } catch {
            print(error)
        }

    }
    // Метод для запису hardAnswer в базу даних
    func writingRealmAnswer(answer: String) {
        let currentAnswer = answer
        let newAnswer = HardAnswer(answer: currentAnswer)
        
        do {
        try realm.write {
               realm.add(newAnswer)
           }
           let path = realm.configuration.fileURL?.path
           print("Path: \(String(describing: path))")
        } catch {
            print("Error")
        }
    }
}

////
////  FetchAnswer.swift
////  New_8_Ball
////
////  Created by Андрій Кузьмич on 19.02.2022.
////
//
//import Foundation
//
//
//protocol FetchAnswer{
//    func fetchAnswer()
//}
//
//
//
//
//class FetchRealmAnswer: FetchAnswer {
//    
//    private let realmService = RealmService()
//    var realmAnswer = Dynamic("")
//    func fetchAnswer() {
//        
//        self.realmService.getingRealmAnswer {(answer) in
//            self.realmAnswer.value = answer
//            print("mainViewModel - \(answer)")
//        }
//    }
//     
//    
//    
//}
//
//class FetchJSONAnwer: FetchAnswer{
//    private let jsonService = JSONService()
//    var jsonAnswer = Dynamic("")
//    var empData: Answers!
//    
//    func fetchAnswer() {
//        self.jsonService.getingJSONAnswer {(empData) in
//            self.empData = empData
//            self.jsonAnswer.value = empData.magic.answer
//        }
//    }
//    }
//    
//    
//}

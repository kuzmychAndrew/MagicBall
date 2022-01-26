//
//  JSONServices.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation
import Alamofire
class JSONService{
    // Метод для отримання даних з веб ресурсу
    func getAnswer(completion : @escaping (Answers) ->()){
        let url = URL(string: "https://8ball.delegator.com/magic/JSON/why")!
        
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData {responseData in
            print(responseData)
            switch responseData.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(Answers.self, from: data)
                    completion(empData)
                    dump(empData)
                    print(empData)
//
                
            case .failure(let error):
                print(error)
//
//
            }
        }
    }
}

//URLSession.shared.dataTask(with: url){ (data, urlResponse, error) in
//            DispatchQueue.main.async {
//
//
//
//            if let data = data {
//                let jsonDecoder = JSONDecoder()
////                print(data)
//
//                let empData = try! jsonDecoder.decode(Answers.self, from: data)
//                completion(empData)
//                dump(empData)
//                print(empData)
//            }else{
//
//            }
//            }
//        }.resume()


//let json = JSON(value)
//                for (i, j) in json["magic"]{
//                    if i == "answer"{
//                        let answer = j
//                        completion("\(answer)")
//                        print("\(answer)")
//


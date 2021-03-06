//
//  JSONServices.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation
import Alamofire

protocol JSONServiceProtocol{
    func getingJSONAnswer(completion : @escaping (Answers) ->())
}

final class JSONService: JSONServiceProtocol{
    
    // Метод для отримання даних з веб ресурсу
    func getingJSONAnswer(completion : @escaping (Answers) ->()){
        let url = URL(string: "https://8ball.delegator.com/magic/JSON/why")!
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            AF.request(url, method: .get, encoding: URLEncoding.default).responseData {responseData in
                print(responseData)
                switch responseData.result{
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    let empData = try! jsonDecoder.decode(Answers.self, from: data)
                    completion(empData)
                    dump(empData)
                    print(empData)
                case .failure(let error):
                print(error)

                }
            }
        }
    }
}


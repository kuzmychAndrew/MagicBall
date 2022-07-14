//
//  RealmModel.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation
import RealmSwift


final class HardAnswer: Object{
    @objc dynamic public var answer = ""
    @objc dynamic private var id = ObjectId.generate()

    convenience init(answer:String) {

        self.init()
        self.answer = answer
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}

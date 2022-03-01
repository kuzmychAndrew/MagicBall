//
//  ViewBilder.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 19.02.2022.
//

import Foundation
import UIKit

class ViewModelBilder {

    static func createMainModule() -> MainViewModel {

    let jsonService = JSONService()
    let reamService = RealmService()
    let mainViewModel = MainViewModel(jsonService: jsonService, realmService: reamService)
        return mainViewModel
    }
    static func createSettingModule() -> SettingViewModel {

    let reamService = RealmService()
    let mainSettingModel = SettingViewModel(realmService: reamService)
        return mainSettingModel
    }

//    static func loadMainView()-> MainView{
//        let mainView = MainView()
//        return mainView
//    }

}

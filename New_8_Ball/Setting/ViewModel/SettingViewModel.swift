//
//  SettingViewModel.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 26.01.2022.
//

import Foundation

final class SettingViewModel {

    // Ініціалізуємо зовнішні сервіси
    private var realmService: realmServiceProtocol
    public var hardAnswer = Dynamic("")

    init (realmService: realmServiceProtocol) {
        self.realmService = realmService

    }
        // Отримання даних з View та передача даних в зовнішній ресурс

    func writeAnswer(answer: String) {
        realmService.writingRealmAnswer(answer: answer)
    }
}

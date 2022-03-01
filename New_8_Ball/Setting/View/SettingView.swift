//
//  SettingView.swift
//  New_8_Ball
//
//  Created by Андрій Кузьмич on 21.02.2022.
//

import UIKit

class SettingView: UIView {
    var label: UILabel!
    var answerField: UITextField!
    var saveB: UIButton!

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        createViews()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createViews() {
            let view = UIView()
                view.backgroundColor = .white

                label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.textAlignment = .left
                label.backgroundColor = .white
                label.text = "Enter your hard Answer"
                label.numberOfLines = 0
                label.font = UIFont.systemFont(ofSize: 16)
                label.textColor = UIColor.lightGray
                self.addSubview(label)

                answerField = UITextField()
                answerField.translatesAutoresizingMaskIntoConstraints = false
                answerField.textAlignment = .center
                answerField.backgroundColor = .lightGray
                answerField.textColor = .white
                answerField.font = UIFont.systemFont(ofSize: 24)
        self.addSubview(answerField)

                saveB = UIButton()
                saveB.translatesAutoresizingMaskIntoConstraints = false
                saveB.setTitle("Save", for: .normal)
                saveB.backgroundColor = .systemBlue
                saveB.layer.cornerRadius = 5

        self.addSubview(saveB)

                // Задання розміщення елементів та задання мінімальних обмежень

                NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: +300),
                    label.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20),
                    label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: +20),

                    answerField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: +5),
                    answerField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: +20),
                    answerField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20),

                    saveB.topAnchor.constraint(equalTo: answerField.layoutMarginsGuide.topAnchor, constant: +40),
                    saveB.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -80),
                    saveB.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: +80)

                ])
    }

}

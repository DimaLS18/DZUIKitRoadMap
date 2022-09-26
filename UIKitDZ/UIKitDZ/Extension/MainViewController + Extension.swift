//
//  MainViewController + Extension.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 24.09.2022.
//

import Foundation
import UIKit
/// расширение для констрейнтов
extension MainViewController {
     func setConstraints() {
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50)

        ])
         NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)

         ])
    }
}

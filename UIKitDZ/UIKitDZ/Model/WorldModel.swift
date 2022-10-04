//
//  WorldModel.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 24.09.2022.
//

import Foundation
import UIKit
///  модель Word  - возвращает нужное значение
struct Word {
    func makeWord(word: String) -> String {
        switch word {
        case "leohl":
            return "Hello"
        default:
            return "Введеите leohl"
        }
    }
}

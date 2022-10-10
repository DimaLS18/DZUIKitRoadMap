//
//  TimerViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 06.10.2022.
//

import UIKit
/// контроллер таймера

final class TimerViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet private weak var timerPickerView: UIPickerView!

    // MARK: - Private properties

    private lazy var hour = 0
    private lazy var minutes = 0
    private lazy var second = 0

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        timePickerDelegate()
        timePickerdataSource()
    }
    // MARK: - Private method
    private func timePickerDelegate() {
        timerPickerView.delegate = self
    }

    private func timePickerdataSource() {
        timerPickerView.dataSource = self
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension TimerViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1, 2:
            return 60
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width / 3
    }

    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        switch component {
        case 0:
            return "\(row)"
        case 1:
            return "\(row)"
        case 2:
            return "\(row)"
        default:
            return ""
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            second = row
        default:
            break
        }
    }
}

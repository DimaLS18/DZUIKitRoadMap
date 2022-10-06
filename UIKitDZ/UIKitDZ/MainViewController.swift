//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
final class MainViewController: UIViewController {

    // MARK: - PrivateProperty
    private var textLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 20, y: 98, width: 320, height: 290)
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.shadowColor = .black
        return label
    }()

    private lazy var sizeTextSlider: UISlider = {
        var slider = UISlider()
        slider.minimumValue = 10
        slider.maximumValue = 50
        slider.frame = CGRect(x: 20, y: 420, width: 320, height: 30)
        slider.addTarget(self, action: #selector(sizeTextAction), for: .valueChanged)
        return slider
    }()

    private let textColorPicker: UIPickerView = {
        var picker = UIPickerView()
        picker.frame = CGRect(x: 20, y: 530, width: 170, height: 160)
        picker.tag = 1
        return picker
    }()

    private let amountLinesPicker: UIPickerView = {
        var picker = UIPickerView()
        picker.frame = CGRect(x: 200, y: 530, width: 170, height: 160)
        picker.tag = 2
        return picker
    }()

    lazy var textShadowSwitch: UISwitch = {
        var shadowSwitch = UISwitch()
        shadowSwitch.frame = CGRect(x: 80, y: 740, width: 0, height: 0)
        shadowSwitch.isOn = false
        shadowSwitch.addTarget(self, action: #selector(textShadowAction), for: .valueChanged)
        return shadowSwitch
    }()

    lazy var textTransferSwitch: UISwitch = {
        var textSwitch = UISwitch()
        textSwitch.frame = CGRect(x: 270, y: 740, width: 0, height: 0)
        textSwitch.isOn = false
        textSwitch.addTarget(self, action: #selector(textTransferAction), for: .valueChanged)
        return textSwitch
    }()

    private let sizeLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 140, y: 450, width: 100, height: 30)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = "Размер шрифта"
        return label
    }()

    private let choiceColorLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 50, y: 520, width: 100, height: 30)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = "Выбор цвета"
        return label
    }()

    private let choiceLineLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 250, y: 520, width: 100, height: 30)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = "Выбор линий"
        return label
    }()

    private let transferLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 255, y: 690, width: 100, height: 30)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = "Перенос"
        return label
    }()

    private let shadowLabel: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 55, y: 690, width: 100, height: 30)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = "Тень"
        return label
    }()

    lazy var addTextBarButton: UIBarButtonItem = {
        var button = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(addTextAction))
        button.tintColor = UIColor.black
        return button
    }()

    private let amountLines = [0, 1, 2]
    private let textColors = [UIColor.black, UIColor.orange, UIColor.red, UIColor.blue, UIColor.green]
    private let nameTextColors = ["Черный", "Оранжевый", "Красный", "Синий", "Зеленый"]

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        view.addSubview(textLabel)
        view.addSubview(sizeTextSlider)
        view.addSubview(textColorPicker)
        view.addSubview(amountLinesPicker)
        view.addSubview(textColorPicker)
        view.addSubview(textShadowSwitch)
        view.addSubview(textTransferSwitch)
        view.addSubview(textColorPicker)
        view.addSubview(sizeLabel)
        view.addSubview(choiceColorLabel)
        view.addSubview(choiceLineLabel)
        view.addSubview(transferLabel)
        view.addSubview(shadowLabel)

        navigationItem.rightBarButtonItem = addTextBarButton

                textColorPicker.delegate = self
                textColorPicker.dataSource = self
                amountLinesPicker.delegate = self
                amountLinesPicker.dataSource = self
    }

    // MARK: - obj Private Methods

    @objc private func sizeTextAction() {
        textLabel.font = textLabel.font.withSize(CGFloat(sizeTextSlider.value))

    }

    @objc private func textShadowAction() {
        if textShadowSwitch.isOn {
            textLabel.shadowOffset = CGSize(width: 2, height: 3)
        } else {
            textLabel.shadowOffset = CGSize(width: 0, height: 0)
        }
    }

    @objc private func textTransferAction() {
        if textTransferSwitch.isOn {
            textLabel.lineBreakMode = .byWordWrapping
        } else {
            textLabel.lineBreakMode = .byCharWrapping
        }
    }

    @objc private func addTextAction() {
        let alertController = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Принять", style: .default) {_ in
            self.textLabel.text = alertController.textFields?.first?.text ?? ""
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return textColors.count
        case 2:
            return amountLines.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return nameTextColors[row]
        case 2:
            return String(amountLines[row])
        default:
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            textLabel.textColor = textColors[row]
        case 2:
            textLabel.numberOfLines = amountLines[row]
        default:
            break
        }
    }
}

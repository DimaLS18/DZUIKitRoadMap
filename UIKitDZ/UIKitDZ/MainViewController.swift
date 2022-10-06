//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// контроллер чтения книги
final class MainViewController: UIViewController {

    // MARK: - Constant

    enum Constants {
        static let iBook = """
Swift появился в 2014 году. Создателем языка программирования является компания Apple.
 Согласно заявлениям официальных представителей, Свифт был заложен в платформе NeXT,
 которая выпускалась в начале 90-х годов прошлого столетия.
Именно эта платформа и стала прародительницей современный iOS и macOS.
Разработкой текущей версии языка сотрудники Apple занимались еще с 2010 года.
 Примечательно, что этот язык не имеет как такового одного «родителя».
 Вместо этого, создатели Swift взяли понемногу от разных языков, например, Object-C,
Haskell, Python, C#, CLU и ряда других.
Презентация Свифт состоялась в 2014 году.
В это же время разработчикам стала доступна официальная документация по языку на 500 страницах печатного текста.
Ровно спустя один год вышла вторая версия Swift.
 В отличие от первой она стала более производительной.
В 2019 году вышла последняя на данный момент 5 версия ЯП.
"""

        static let increaseThickness = "A"
        static let reduceThickness = "a"
        static let nameTextFronts = ["Optima", "Helvetica", "American Typewriter", "Times New Roman"]
        static let textFont = [UIFont(name: "Helvetica", size: 17),
                               UIFont(name: "Times New Roman", size: 17),
                               UIFont(name: "Optima", size: 17),
                               UIFont(name: "American Typewriter", size: 17)]
    }

    // MARK: - Private Properties

    private let bookTextView = UITextView()
    private let sizeTextSlider = UISlider()
    private let sizeLabel = UILabel()
    private let fontsPicker = UIPickerView()
    private let backgroundColorSwitch = UISwitch()
    private let increaseThicknessFontButton = UIButton(type: .roundedRect)
    private let reduceThicknessFontButton = UIButton(type: .roundedRect)
    private let textColorBlackButton = UIButton(type: .roundedRect)
    private let textColorWhiteButton = UIButton(type: .roundedRect)
    private let textColorRedButton = UIButton(type: .roundedRect)
    private let textColorBlueButton = UIButton(type: .roundedRect)
    private let shareButton = UIButton(type: .roundedRect)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func createTextView() {
        bookTextView.frame = CGRect(x: 20, y: 90, width: view.bounds.width - 40,
                                    height: view.bounds.height / 2)
        bookTextView.text = Constants.iBook
        bookTextView.isEditable = false
        bookTextView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        bookTextView.font = UIFont.systemFont(ofSize: 17)
        bookTextView.backgroundColor = .white
        view.addSubview(bookTextView)
    }

    private func increaseFontButton() {
        increaseThicknessFontButton.frame = CGRect(x: 300, y: 670, width: 50, height: 50)
        increaseThicknessFontButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 30)
        increaseThicknessFontButton.setTitle(Constants.increaseThickness, for: .normal)
        increaseThicknessFontButton.addTarget(self,
                                              action: #selector(increaseThicknessFontAction),
                                              for: .touchUpInside)
        view.addSubview(increaseThicknessFontButton)
    }

    private func reduceFontButton() {
        reduceThicknessFontButton.frame = CGRect(x: 300, y: 720, width: 50, height: 50)
        reduceThicknessFontButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 30)
        reduceThicknessFontButton.setTitle(Constants.reduceThickness, for: .normal)
        reduceThicknessFontButton.addTarget(self, action: #selector(reduceThicknessFontAction), for: .touchUpInside)
        view.addSubview(reduceThicknessFontButton)
    }

    private func blackTextColorButton() {
        textColorBlackButton.frame = CGRect(x: 50, y: 600, width: 40, height: 40)
        textColorBlackButton.backgroundColor = .black
        textColorBlackButton.layer.borderWidth = 1
        textColorBlackButton.layer.borderColor = UIColor.gray.cgColor
        textColorBlackButton.layer.cornerRadius = textColorBlackButton.frame.size.height / 2
        textColorBlackButton.addTarget(self, action: #selector(textColorBlackAction), for: .touchUpInside)
        view.addSubview(textColorBlackButton)
    }
    private func whiteTextColorButton() {
        textColorWhiteButton.frame = CGRect(x: 100, y: 600, width: 40, height: 40)
        textColorWhiteButton.backgroundColor = .white
        textColorWhiteButton.layer.borderWidth = 1
        textColorWhiteButton.layer.borderColor = UIColor.gray.cgColor
        textColorWhiteButton.layer.cornerRadius = textColorWhiteButton.frame.size.height / 2
        textColorWhiteButton.addTarget(self, action: #selector(textColorWhiteAction), for: .touchUpInside)
        view.addSubview(textColorWhiteButton)
    }

    private func redTextColorButton() {
        textColorRedButton.frame = CGRect(x: 150, y: 600, width: 40, height: 40)
        textColorRedButton.backgroundColor = .red
        textColorRedButton.layer.borderWidth = 1
        textColorRedButton.layer.borderColor = UIColor.gray.cgColor
        textColorRedButton.layer.cornerRadius = textColorRedButton.frame.size.height / 2
        textColorRedButton.addTarget(self, action: #selector(textColorRedAction), for: .touchUpInside)
        view.addSubview(textColorRedButton)
    }

    private func blueTextColorButton() {
        textColorBlueButton.frame = CGRect(x: 200, y: 600, width: 40, height: 40)
        textColorBlueButton.backgroundColor = .blue
        textColorBlueButton.layer.borderWidth = 1
        textColorBlueButton.layer.borderColor = UIColor.gray.cgColor
        textColorBlueButton.layer.cornerRadius = textColorBlueButton.frame.size.height / 2
        textColorBlueButton.addTarget(self, action: #selector(textColorBlueAction), for: .touchUpInside)
        view.addSubview(textColorBlueButton)
    }

    private func createSlider() {
        sizeTextSlider.frame = CGRect(x: 20, y: 550, width: 374, height: 30)
        sizeTextSlider.thumbTintColor = .link
        sizeTextSlider.minimumValue = 10
        sizeTextSlider.maximumValue = 70
        sizeTextSlider.addTarget(self, action: #selector(sizeTextAction), for: .valueChanged)
        view.addSubview(sizeTextSlider)
    }

    private func createPicker() {
        fontsPicker.frame = CGRect(x: 20, y: 640, width: 250, height: 160)
        fontsPicker.delegate = self
        fontsPicker.dataSource = self
        view.addSubview(fontsPicker)
    }

    private func createSwitch() {
        backgroundColorSwitch.frame = CGRect(x: 300, y: 605, width: 0, height: 0)
        backgroundColorSwitch.onTintColor = .link
        backgroundColorSwitch.addTarget(self, action: #selector(backgroundColorAction), for: .valueChanged)
        backgroundColorSwitch.isOn = true
        view.addSubview(backgroundColorSwitch)
    }

    private func setupView() {
        reduceFontButton()
        increaseFontButton()
        blackTextColorButton()
        whiteTextColorButton()
        redTextColorButton()
        blueTextColorButton()
        createSlider()
        createPicker()
        createSwitch()
        createTextView()
    }
    // MARK: - objc Private Methods
    @objc private func increaseThicknessFontAction() {
        bookTextView.font = UIFont.boldSystemFont(ofSize: bookTextView.font?.pointSize ?? 10)
    }

    @objc private func reduceThicknessFontAction() {
        bookTextView.font = UIFont.systemFont(ofSize: bookTextView.font?.pointSize ?? 10)
    }

    @objc private func textColorBlackAction() {
        bookTextView.textColor = .black
    }

    @objc private func textColorWhiteAction() {
        bookTextView.textColor = .white
    }

    @objc private func textColorRedAction() {
        bookTextView.textColor = .red
    }

    @objc private func textColorBlueAction() {
        bookTextView.textColor = .blue
    }

    @objc private func backgroundColorAction() {
        if backgroundColorSwitch.isOn {
            view.backgroundColor = .white
            bookTextView.backgroundColor = .white
        } else {
            view.backgroundColor = .black
            bookTextView.backgroundColor = .black
        }
    }

    @objc private func sizeTextAction() {
        bookTextView.font = bookTextView.font?.withSize(CGFloat(sizeTextSlider.value))
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return Constants.textFont.count
    }

    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return Constants.nameTextFronts[row]
    }

    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        bookTextView.font = Constants.textFont[row]
    }
}

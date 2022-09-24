//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
class MainViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет,  "
        label.textColor = #colorLiteral(red: 0.9058823529, green: 0.9647058824, blue: 0.9490196078, alpha: 1)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var additionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor =  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 5
        button.layer.borderColor = #colorLiteral(red: 0.2235294118, green: 0.3568627451, blue: 0.3921568627, alpha: 1)
        button.setTitle("СЛОЖЕНИЕ", for: .normal)
        button.addTarget(self, action: #selector(additionAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var guesTheNumberButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("УГАДАЙ ЧИСЛО", for: .normal)
        button.tintColor = .black
        button.layer.borderWidth = 5
        button.layer.borderColor = #colorLiteral(red: 0.2235294118, green: 0.3568627451, blue: 0.3921568627, alpha: 1)
        button.addTarget(self, action: #selector(guessNumberAllert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let resultLabel: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.9058823529, green: 0.9647058824, blue: 0.9490196078, alpha: 1)
        label.text = "Результат сложения"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let hiddenNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9058823529, green: 0.9647058824, blue: 0.9490196078, alpha: 1)
        label.text = "Загаданное число"

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let number = "19"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConsrtaints()
        welcomeAllert()
        additionAlert()
    }

    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.2, blue: 0.2, alpha: 1)

        view.addSubview(nameLabel)
        view.addSubview(additionButton)
        view.addSubview(guesTheNumberButton)
        view.addSubview(resultLabel)
        view.addSubview(hiddenNumberLabel)
    }

    func welcomeAllert() {
        let welcomeAllert = UIAlertController(title: "Привет",
                                              message: "Введите свое имя",
                                              preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            guard let text = welcomeAllert.textFields?.first else { return }
            self.nameLabel.text = text.text
        }
        welcomeAllert.addTextField { _ in
        }
        welcomeAllert.addAction(action)
        self.present(welcomeAllert, animated: true, completion: nil)
    }

    @objc func additionAlert() {
        let additionAllert = UIAlertController(title: "Сложение",
                                               message: "Введите числа",
                                               preferredStyle: .alert)
        let additionAction = UIAlertAction(title: "узнайте сумму двух чисел", style: .default) { _ in
            guard let numberOne = additionAllert.textFields?.first else { return }
            guard let numberTwo = additionAllert.textFields?.last else { return }
            let intNumberOne = Int(numberOne.text ?? "0") ?? 0
            let intNumberTwo = Int(numberTwo.text ?? "0") ?? 0
            self.resultLabel.text = String(intNumberOne + intNumberTwo)
        }
        additionAllert.addTextField { _ in}
        additionAllert.addTextField { _ in}

        additionAllert.addAction(additionAction)
        self.present(additionAllert, animated: true, completion: nil)
    }

    @objc func guessNumberAllert() {
        let number = Int.random(in: 1...10)
        let numberAllert = UIAlertController(title: "угадай число",
                                             message: "Какое число я загадал?",
                                             preferredStyle: .alert)
        let numberAllertAction = UIAlertAction(title: "проверить", style: .default) { _ in
            guard let userNumber = numberAllert.textFields?.first else { return }
            let userInt = Int(userNumber.text ?? "0")
            if userInt == number {
                self.hiddenNumberLabel.text = "Вы угадали.Я загадал - \(number) "
            } else {
                self.hiddenNumberLabel.text = "Вы не угадали. Я загада - \(number)"
            }
        }
        numberAllert.addTextField { _ in }
        numberAllert.addAction(numberAllertAction)
        self.present(numberAllert, animated: true, completion: nil)
    }

}

extension MainViewController {
    private func setConsrtaints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            additionButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 200),
            additionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            additionButton.heightAnchor.constraint(equalToConstant: 50),
            additionButton.widthAnchor.constraint(equalToConstant: 200)
        ])

        NSLayoutConstraint.activate([
            guesTheNumberButton.topAnchor.constraint(equalTo: additionButton.bottomAnchor, constant: 100),
            guesTheNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guesTheNumberButton.heightAnchor.constraint(equalToConstant: 50),
            guesTheNumberButton.widthAnchor.constraint(equalToConstant: 200)
        ])

        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: additionButton.bottomAnchor, constant: 10),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
        NSLayoutConstraint.activate([
            hiddenNumberLabel.topAnchor.constraint(equalTo: guesTheNumberButton.bottomAnchor, constant: 10),
            hiddenNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

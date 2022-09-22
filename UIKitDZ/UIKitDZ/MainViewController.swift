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

    @objc func welcomeAllert() {}

    @objc func additionAlert() {}

    @objc func guessNumberAllert() { }

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

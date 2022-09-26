//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
class MainViewController: UIViewController {

    private var birthdayReminder: UILabel = {
        let label = UILabel()
        label.text =  "Birthday Reminder"
        label.textColor = .black
        label.layer.borderWidth = CGFloat(1)
        label.textAlignment = .center
        label.frame = CGRect(x: 100, y: 100, width: 200, height: 70)
        return label
    }()

    private var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textColor = .black
        label.font = UIFont(name: "Arial Bold", size: 20)
        label.frame = CGRect(x: 60, y: 250, width: 80, height: 40)
        return label
    }()

    private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        label.font = UIFont(name: "Arial Bold", size: 15)
        label.frame = CGRect(x: 60, y: 300, width: 50, height: 30)
        return label
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "введите свой email"
        textField.frame = CGRect(x: 60, y: 320, width: 270, height: 50)
        textField.borderStyle = .none
        return textField
    }()

    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        label.font = UIFont(name: "Arial Bold", size: 15)
        label.frame = CGRect(x: 60, y: 400, width: 100, height: 30)
        return label
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "введите свой пароль"
        textField.isSecureTextEntry = true
        textField.frame = CGRect(x: 60, y: 420, width: 270, height: 50)
        textField.borderStyle = .none
        return textField
    }()

    private var faceIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Вход по Face ID"
        label.frame = CGRect(x: 100, y: 500, width: 150, height: 30)
        return label
    }()

    private var faceIdSwitch: UISwitch = {
        let faseId = UISwitch()
        faseId.isOn = true
        faseId.frame = CGRect(x: 300, y: 500, width: 30, height: 30)
        return faseId
    }()

    private lazy var enterBottom: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.frame = CGRect(x: 80, y: 600, width: 220, height: 70)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(enterBottonAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(birthdayReminder)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(faceIdLabel)
        view.addSubview(faceIdSwitch)
        view.addSubview(enterBottom)
    }

    @objc private func enterBottonAction() {
        let birthdayVC = BirthdayViewController()
        self.navigationController?.pushViewController(birthdayVC, animated: true)
    }
}

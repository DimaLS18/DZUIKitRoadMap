//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
///  контроллер авторизации пользователя
class RegisterViewController: UIViewController {

    // MARK: - UIProperties
    
    private var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.contentMode = .scaleAspectFill

        image.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        return image
    }()

    private var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
        return label
    }()

    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите свой телефон"
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.frame = CGRect(x: 50, y: 350, width: 300, height: 50)
        return textField
    }()

    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.frame = CGRect(x: 50, y: 400, width: 300, height: 50)
        return label
    }()

    lazy var passwpordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "введите свой пароль"
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.frame = CGRect(x: 50, y: 450, width: 300, height: 50)
        return textField
    }()

    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("войти", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(enterBottonAction), for: .touchUpInside)
        button.frame = CGRect(x: 40, y: 550, width: 300, height: 50)
        return button
    }()

    // MARK: - LifeCicles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - PrivateMethod
    
    private func setupView() {
        view.backgroundColor = .white

        view.addSubview(phoneLabel)
        view.addSubview(passwordLabel)
        view.addSubview(phoneTextField)
        view.addSubview(passwpordTextField)
        view.addSubview(enterButton)
        view.addSubview(logoImage)
        view.addSubview(logoImage)
    }

    @objc private func enterBottonAction() {
        let foodVC = FoodViewController()
        let navigationController = UINavigationController(rootViewController: foodVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

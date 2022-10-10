//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// Экран входа
final class LoginViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    // MARK: - Private properties
    private(set) var key = ""

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - IBAction
    @IBAction func registerButtonAction(_ sender: Any) {
        goToRegisterVC()
    }
    @IBAction func entetButtonAction(_ sender: Any) {
        if loginTextField.text == key {
            goToShopVC()
        }
        print("NO")
    }

    // MARK: - Private method
    private func setupView() {
        view.backgroundColor = .white

        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        key = UserDefaults.standard.string(forKey: "loginTextField") ?? ""
    }

    private func goToShopVC() {
        let shopVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = shopVC.instantiateViewController(withIdentifier: "ShopViewController")
                as? ShopViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.show(nextVC, sender: nil)
    }

    private func goToRegisterVC() {
        let registerVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = registerVC.instantiateViewController(withIdentifier: "RegisterViewController")
                as? RegisterViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.show(nextVC, sender: nil)
    }
}

 // MARK: - Extension UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}

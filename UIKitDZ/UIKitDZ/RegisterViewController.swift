//
//  RegisterViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 05.10.2022.
//

import UIKit
/// экран регистрации
final class RegisterViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var mobileTextField: UITextField!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - PrivateProperty
    
    private let defaults = UserDefaults.standard
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    // MARK: - IBAction
    
    @IBAction func registerButtonAction(_ sender: Any) {
        goToLoginVC()
    }
    
    // MARK: - Private method
    
    private func setupView() {
        view.backgroundColor = .white
        
        setupKeyboardHiding()
        mobileTextField.delegate = self
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShowAction),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHideAction),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func goToLoginVC() {
        let loginVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = loginVC.instantiateViewController(withIdentifier: "LoginViewController")
                as? LoginViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.show(nextVC, sender: nil)
    }
    
    @objc private func keyboardWillShowAction(sender: NSNotification) {
        view.frame.origin.y = -200
    }
    
    @objc private func keyboardWillHideAction(sender: NSNotification) {
        view.frame.origin.y = 0
    }
    
}

// MARK: - Extension UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case mobileTextField:
            loginTextField.becomeFirstResponder()
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

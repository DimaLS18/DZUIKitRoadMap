//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// контроллер для авторизации пользователя
class MainViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var enterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(oneTopAction(_:)))
        view.addGestureRecognizer(recognizer)
    }

       @objc func oneTopAction(_ sender: Any) {
            self.view.endEditing(true)
        }
    }

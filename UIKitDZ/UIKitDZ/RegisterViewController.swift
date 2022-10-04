//
//  RegisterViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 24.09.2022.
//

import UIKit
/// контроллер ввода данных пользователя
class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextFiaeld: UITextField!
    @IBOutlet weak var countGuestTextField: UITextField!

    @IBOutlet weak var billButton: UIButton!

    @IBOutlet weak var tableSwitch: UISwitch!
    @IBOutlet weak var prepaySwitch: UISwitch!
    @IBOutlet weak var vipSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func billButtonAction(_ sender: Any) {
        showAlert()
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Вывести чек", message: .none, preferredStyle: .alert)
        alert.addAction(
        UIAlertAction(title: "Да", style: .default, handler: { _ in
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let checkViewController = storyboard.instantiateViewController(
                    withIdentifier: "CheckViewController") as? CheckViewController else { return }
                    checkViewController.modalPresentationStyle = .fullScreen
                    self.show(checkViewController, sender: nil)
            })
        )
        alert.addAction(
            UIAlertAction(title: "Нет", style: .cancel, handler: { _ in
                print("")
            })
        )
        present(alert, animated: true, completion: nil)
    }
}

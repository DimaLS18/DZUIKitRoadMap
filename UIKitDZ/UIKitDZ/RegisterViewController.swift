//
//  RegisterViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 24.09.2022.
//

import UIKit
/// второй контроллер
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

    @IBAction func tabbleSwitchAction(_ sender: UISwitch) {
    }

    @IBAction func prepaySwitchAction(_ sender: UISwitch) {

    }

    @IBAction func vipSwitchAction(_ sender: UISwitch) {
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
//                     self.navigationController?.pushViewController(checkViewController, animated: true)
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

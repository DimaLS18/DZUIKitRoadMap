//
//  BucketViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 29.09.2022.
//

import UIKit
/// контроллер оплаты
class BucketViewController: UIViewController {

    // MARK: - UIProperties

    private let orderInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.frame = CGRect(x: 20, y: 100, width: 300, height: 300)
        label.text = "Ваш заказ:\n"
        return label
    }()

    private lazy var paymentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "applelogo"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.setTitle("Pay", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.frame = CGRect(x: 20, y: 700, width: 320, height: 50)
        button.addTarget(self, action: #selector(paymentButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var cardPaymentSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = true
        switcher.frame = CGRect(x: 300, y: 600, width: 50, height: 50)
        switcher.addTarget(self, action: #selector(changePaymentAction), for: .valueChanged)
        return switcher
    }()

    private lazy var cashPaymentSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.frame = CGRect(x: 300, y: 650, width: 50, height: 50)
        switcher.addTarget(self, action: #selector(changePaymentAction), for: .valueChanged)
        return switcher
    }()

    private let cardPaymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата картой"
        label.font = UIFont.systemFont(ofSize: 24)
        label.frame = CGRect(x: 100, y: 600, width: 250, height: 30)
        return label
    }()

    private let cashPaymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Наличными"
        label.font = UIFont.systemFont(ofSize: 24)
        label.frame = CGRect(x: 100, y: 650, width: 250, height: 30)
        return label
    }()

    // MARK: - Private properties

    var returnHandler: (() -> ())?

    private var fullOrders: [String] = [] {
        didSet {
            var counter = 1
            fullOrders.forEach {
                orderInfoLabel.text? += "\n\(counter). \($0)"
                counter += 1
            }
        }
    }

    // MARK: - LifeCicles

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Public methods

    func setupOrderData(orders: String?...) {
        fullOrders = orders.compactMap({ $0 })
    }

    // MARK: - Private methods

    private func setupView() {
        title = "Оплата"

        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .systemGray6
        view.addSubview(paymentButton)
        view.addSubview(cardPaymentSwitch)
        view.addSubview(cashPaymentSwitch)
        view.addSubview(cardPaymentLabel)
        view.addSubview(cashPaymentLabel)
        view.addSubview(orderInfoLabel)
    }

    @objc private func paymentButtonAction() {
        let alert = UIAlertController(title: "Заказ оплачен!",
                    message: "Ваш заказ принят и будет доставлен в течение 15 минут!\nПриятного аппетита",
                    preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                 self.navigationController?.dismiss(animated: true)
                 self.returnHandler?()
             }))
        present(alert, animated: true)
    }

    @objc private func changePaymentAction(_ sender: UISwitch) {
        guard sender == cardPaymentSwitch else {
                     cardPaymentSwitch.isOn.toggle()
                     return
                 }
                 cashPaymentSwitch.isOn.toggle()
    }
}

//
//  CardViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 27.09.2022.
//

import UIKit
/// контроллер совершения покупки
class CardViewController: UIViewController {

    private let checkoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Checkout", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 20, y: 700, width: 350, height: 50)
        return button
    }()

    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 650, width: 100, height: 30)
        return label
    }()

    private let totalAmoutLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 800"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 300, y: 650, width: 100, height: 30)
        return label
    }()

    private let shippingLabel: UILabel = {
        let label = UILabel()
        label.text = "Shipping"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 550, width: 100, height: 30)
        return label
    }()

    private let shippingAmoutLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 100.00"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 300, y: 550, width: 100, height: 30)
        return label
    }()

    private let subtotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Sub Total"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 500, width: 100, height: 30)
        return label
    }()

    private let subtotalAmoutLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 900"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 300, y: 500, width: 100, height: 30)
        return label
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addItemBlock(imageName: "iphone14", itemName: "IPHONE 14", yCoordinates: 100)
     
    }

    // MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .white
        title = "My Cart"

        view.addSubview(checkoutButton)
        view.addSubview(totalLabel)
        view.addSubview(totalAmoutLabel)
        view.addSubview(shippingLabel)
        view.addSubview(shippingAmoutLabel)
        view.addSubview(subtotalLabel)
        view.addSubview(subtotalAmoutLabel)
    }

    private func addItemBlock(imageName: String, itemName: String, yCoordinates: Int) {
        let itemImageView = UIImageView(image: UIImage(named: imageName))
        itemImageView.frame = CGRect(x: 20, y: yCoordinates, width: 100, height: 150)
        view.addSubview(itemImageView)

        let itemNameLabel = UILabel()
        itemNameLabel.text = itemName
        itemNameLabel.frame = CGRect(x: 200, y: yCoordinates, width: 100, height: 30)
        view.addSubview(itemNameLabel)

        let itemPriceLabel = UILabel()
        itemPriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        itemPriceLabel.text = "$ 100"
        itemPriceLabel.frame = CGRect(x: 200, y: itemNameLabel.frame.maxY + 10, width: 100, height: 30)
        view.addSubview(itemPriceLabel)
    }
}

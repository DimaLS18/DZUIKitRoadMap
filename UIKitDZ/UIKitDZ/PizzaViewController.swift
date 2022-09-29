//
//  PizzaViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 28.09.2022.
//

import UIKit
/// Pizza VC
final class PizzaViewController: UIViewController {

    private var peperoniImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "peperoni")
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: 30, y: 100, width: 70, height: 70)
        return image
    }()

    private var peperoniLabel: UILabel = {
        let label = UILabel()
        label.text = "Пепперони"
        label.frame = CGRect(x: 120, y: 100, width: 100, height: 50)
        return label
    }()

    private var margaritaImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chees")
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: 30, y: 200, width: 70, height: 70)
        return image
    }()

    private var margaritaiLabel: UILabel = {
        let label = UILabel()
        label.text = "Маргарита"
        label.frame = CGRect(x: 120, y: 200, width: 100, height: 50)
        return label
    }()

    private lazy var addPepperoniButton: UIButton = {
            let button = UIButton()
            button.setTitle("+", for: .normal)
            button.setTitleColor(.systemOrange, for: .normal)
            button.backgroundColor = .white
            button.layer.borderColor = UIColor.systemOrange.cgColor
            button.layer.borderWidth = 1.5
            button.layer.cornerRadius = 20
            button.frame = CGRect(x: 280, y: 115, width: 40, height: 40)
            button.addTarget(self, action: #selector(selectPizzaAction), for: .touchUpInside)
            return button
        }()

    private lazy var addMargaritaButton: UIButton = {
            let button = UIButton()
            button.setTitle("+", for: .normal)
            button.setTitleColor(.systemOrange, for: .normal)
            button.backgroundColor = .white
            button.layer.borderColor = UIColor.systemOrange.cgColor
            button.layer.borderWidth = 1.5
            button.layer.cornerRadius = 20
            button.frame = CGRect(x: 280, y: 215, width: 40, height: 40)
            button.addTarget(self, action: #selector(selectPizzaAction), for: .touchUpInside)
            return button
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(margaritaImage)
        view.addSubview(peperoniImage)
        view.addSubview(peperoniLabel)
        view.addSubview(margaritaiLabel)
        view.addSubview(addPepperoniButton)
        view.addSubview(addMargaritaButton)

    }
    private func openPizzaDetails(pizzaName: String, pizzaImageName: String) {
            let pizzaDetailVC = PizzaDetailViewController()
            pizzaDetailVC.setupPizzaData(pizzaName: pizzaName, pizzaImageName: pizzaImageName)
            present(pizzaDetailVC, animated: true)
        }

        @objc private func selectPizzaAction(_ sender: UIButton) {
            switch sender {
            case addPepperoniButton: openPizzaDetails(pizzaName: "Пепперони", pizzaImageName: "peperoni")
            case addMargaritaButton: openPizzaDetails(pizzaName: "Маргарита", pizzaImageName: "chees")
            default: break
            }
        }

}

////
////  FoodViewController.swift
////  UIKitDZ
////
////  Created by Dima Kovrigin on 28.09.2022.
////
//
import UIKit
/// FOOD VC
 final class FoodViewController: UIViewController {

    lazy var pizzaButton: UIButton = {
        let button = UIButton()
        button.setTitle("ПИЦЦА", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.systemOrange.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pizzaAction), for: .touchUpInside)
        button.frame = CGRect(x: 40, y: 200, width: 300, height: 100)
        return button
    }()

    lazy var rollButton: UIButton = {
        let button = UIButton()
        button.setTitle("РОЛЛЫ", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.systemOrange.cgColor
        button.addTarget(self, action: #selector(pizzaAction), for: .touchUpInside)
        button.frame = CGRect(x: 40, y: 350, width: 300, height: 100)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(pizzaButton)
        view.addSubview(rollButton)
    }

    @objc private func pizzaAction() {
        let pizzaVC = PizzaViewController()
        self.navigationController?.pushViewController(pizzaVC, animated: true)
    }
 }

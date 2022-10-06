//
//  PizzaDetailViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 29.09.2022.
//

import UIKit
/// контроллер добавление индегридиентов к пицце
final class PizzaDetailViewController: UIViewController {

    // MARK: - UIProperties

   private let pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        return imageView
    }()

   private let pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 35, y: 350, width: 200, height: 50)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()

   private lazy var firstToppingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cheesImage")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 20, y: 500, width: 100, height: 125)
        let nameLabel = UILabel()
        nameLabel.text = "СЫР"
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.frame = CGRect(x: 0, y: 10, width: imageView.frame.width, height: 20)
        nameLabel.textAlignment = .center
        imageView.addSubview(nameLabel)
        let priceLabel = UILabel()
        priceLabel.text = "50 руб."
        priceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        priceLabel.frame = CGRect(x: 0, y: 100, width: imageView.frame.width, height: 20)
        priceLabel.textAlignment = .center
        imageView.addSubview(priceLabel)
        imageView.layer.borderColor = UIColor.systemOrange.cgColor
        imageView.layer.borderWidth = 1.5
        imageView.layer.cornerRadius = 5
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addToppingAction))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        return imageView
    }()

   private lazy var secondToppingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "halapeno")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 140, y: 500, width: 100, height: 125)
        let nameLabel = UILabel()
        nameLabel.text = "ХАЛАПЕНЬО"
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.frame = CGRect(x: 0, y: 10, width: imageView.frame.width, height: 20)
        nameLabel.textAlignment = .center
        imageView.addSubview(nameLabel)
        let priceLabel = UILabel()
        priceLabel.text = "50 руб"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        priceLabel.frame = CGRect(x: 0, y: 100, width: imageView.frame.width, height: 20)
        priceLabel.textAlignment = .center
        imageView.addSubview(priceLabel)
        imageView.layer.borderColor = UIColor.systemOrange.cgColor
        imageView.layer.borderWidth = 1.5
        imageView.layer.cornerRadius = 5
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addToppingAction))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        return imageView
    }()

   private lazy var thirdToppingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "becon")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 260, y: 500, width: 100, height: 125)
        let nameLabel = UILabel()
        nameLabel.text = "БЕКОН"
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.frame = CGRect(x: 0, y: 10, width: imageView.frame.width, height: 20)
        nameLabel.textAlignment = .center
        imageView.addSubview(nameLabel)
        let priceLabel = UILabel()
        priceLabel.text = "50 рублей"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        priceLabel.frame = CGRect(x: 0, y: 100, width: imageView.frame.width, height: 20)
        priceLabel.textAlignment = .center
        imageView.addSubview(priceLabel)
        imageView.layer.borderColor = UIColor.systemOrange.cgColor
        imageView.layer.borderWidth = 1.5
        imageView.layer.cornerRadius = 5
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addToppingAction))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        return imageView
    }()

   private let toppingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавить к пицце"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 20, y: 460, width: 200, height: 30)
        return label
    }()

   private lazy var bucketButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 20, y: 650, width: 340, height: 50)
        button.setTitle("Добавить в корзину 350 рублей", for: .normal)
        button.addTarget(self, action: #selector(bucketButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Private properties
    var returnHandler: (() -> ())?

    private var pizzaImageName: String = "" {
        didSet {
            pizzaImageView.image = UIImage(named: pizzaImageName)
        }
    }

    private var pizzaName: String = "" {
        didSet {
            pizzaNameLabel.text = pizzaName
        }
    }

    private var isCheesAdded = false {
        didSet {
            setupTopping(imageView: firstToppingImageView, isAdded: isCheesAdded)
        }
    }

    private var isChilliAdded = false {
        didSet {
            setupTopping(imageView: secondToppingImageView, isAdded: isChilliAdded)
        }
    }

    private var isBaconAdded = false {
        didSet {
            setupTopping(imageView: thirdToppingImageView, isAdded: isBaconAdded)
        }
    }

   private var totalPizzaPrice = 350.00 {
        didSet {
            bucketButton.setTitle("Добавить в корзину  \(totalPizzaPrice)", for: .normal)
        }
    }
    // MARK: - LifeCicles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Public methods

    func setupPizzaData(pizzaName: String, pizzaImageName: String) {
        self.pizzaName = pizzaName
        self.pizzaImageName = pizzaImageName
    }

    // MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(pizzaImageView)
        view.addSubview(pizzaNameLabel)
        view.addSubview(firstToppingImageView)
        view.addSubview(secondToppingImageView)
        view.addSubview(thirdToppingImageView)
        view.addSubview(toppingsLabel)
        view.addSubview(bucketButton)
    }

    private func setupTopping(imageView: UIImageView, isAdded: Bool) {
        guard isAdded else {
             imageView.layer.borderColor = UIColor.orange.cgColor
            totalPizzaPrice -= 50.0
             return
         }
        totalPizzaPrice += 50.0
         imageView.layer.borderColor = UIColor.green.cgColor
     }

    @objc private func addToppingAction(_ sender: UITapGestureRecognizer) {
        switch sender.view {
        case firstToppingImageView: isCheesAdded.toggle()
        case secondToppingImageView: isChilliAdded.toggle()
        case thirdToppingImageView: isBaconAdded.toggle()
        default: break
        }
    }

    @objc private func bucketButtonAction() {
        let bucketVC = BucketViewController()
        let navigationController = UINavigationController(rootViewController: bucketVC)
        navigationController.modalPresentationStyle = .fullScreen
        bucketVC.setupOrderData(orders: pizzaName,
                                isCheesAdded ? "СЫР" : nil,
                                isBaconAdded ? "БЕКОН" : nil,
                                isChilliAdded ? "ХАЛАПЕНЬО" : nil)
        bucketVC.returnHandler = returnHandler
        present(navigationController, animated: true)
    }
}

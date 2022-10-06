//
//  DetailViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 27.09.2022.
//

import UIKit
/// контроллер выбора характеристик
class DetailViewController: UIViewController {

    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 500)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        return imageView
    }()

    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Объем памяти"
        label.textColor = .black
        label.frame = CGRect(x: 40, y: 600, width: 200, height: 30)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let sizeSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["128", "256", "512", "1024"])
        segment.selectedSegmentIndex = 3
        segment.frame = CGRect(x: 40, y: 630, width: 300, height: 50)
        return segment
    }()

    private lazy var cartButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 40, y: 720, width: 300, height: 50)
        button.backgroundColor = .black
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(cartButtonTappedAction), for: .touchUpInside)
        return button
    }()
    private var imageName: String

     // MARK: - Init
     init(imageName: String) {
         self.imageName = imageName
         super.init(nibName: nil, bundle: nil)
     }
    required init?(coder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .red

        view.backgroundColor = .white
        view.addSubview(itemImageView)
        navigationController?.navigationBar.topItem?.title = " "
        navigationController?.navigationBar.tintColor = .black
        view.addSubview(cartButton)
        view.addSubview(sizeLabel)
        view.addSubview(sizeSegment)
    }

    @objc private func cartButtonTappedAction() {
        let cardVC = CardViewController()
        navigationController?.pushViewController(cardVC, animated: true)
    }
}

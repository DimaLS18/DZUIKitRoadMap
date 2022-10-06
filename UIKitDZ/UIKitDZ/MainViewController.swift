//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
class MainViewController: UIViewController {

    private let nameShopLabel: UILabel = {
        let label = UILabel()
        label.text = "MacSore"
        label.frame = CGRect(x: 150, y: 50, width: 200, height: 50)
        return label
    }()

    lazy private var modelSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: modelSigment)
        segment.frame = CGRect(x: 20, y: 100, width: 330, height: 40)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(selectedValueAction), for: .valueChanged)

        return segment
    }()

    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 40, y: 120, width: 300, height: 600)
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(selectProductAction))
        imageView.addGestureRecognizer(gestureRecognizer)
        return imageView
    }()

    private let modelSigment = ["iphone14", "iphone14ProMax", "iphone13ProMax"]

    var productImageArray = [UIImage(named: "iphone14"),
                             UIImage(named: "iphone14ProMax"),
                             UIImage(named: "iphone13ProMax")]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(nameShopLabel)
        view.addSubview(modelSegment)
        view.addSubview(productImageView)

    }

    @objc private func selectedValueAction(target: UISegmentedControl) {
        if target == self.modelSegment {
            let segmentIndex = target.selectedSegmentIndex

            productImageView.image = self.productImageArray[segmentIndex]
        }
    }

    private func openDetails(imageName: String) {
        let detailsVC = DetailViewController(imageName: imageName)
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    @objc private func selectProductAction(_ sender: UITapGestureRecognizer) {
        openDetails(imageName: "iphone14")
    }
}

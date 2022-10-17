//
//  StackViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 17.10.2022.
//

import UIKit

/// constraints на stackView
final class StackViewController: UIViewController {
    
    // MARK: Constants
    private enum Constants {
        static let title = "Stack ViewController"
    }
    
    // MARK: - Private Visual Component
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.spacing = 10.0
        return stackView
    }()
    
    private lazy var redView = createView(color: .red)
    private lazy var yellowView = createView(color: .systemYellow)
    private lazy var greenView = createView(color: .systemGreen)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Methods
    private func setupView() {
        title = Constants.title
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(yellowView)
        stackView.addArrangedSubview(greenView)
        view.addSubview(stackView)
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(
            equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -28).isActive = true
    }
    
    private func createView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

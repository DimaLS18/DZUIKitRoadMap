//
//  AnchorViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 17.10.2022.
//

import UIKit

/// экран с Constraint  при помощи якорей
final class AnchorViewController: UIViewController {
    
    // MARK: Constants
    private enum Constants {
        static let title = "Anchor ViewController"
    }
    
    // MARK: - Private Visual Components
    private lazy var redView = createView(color: .red)
    private lazy var yellowView = createView(color: .systemYellow)
    private lazy var greenView = createView(color: .systemGreen)
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        title = Constants.title
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        createViewRedConstraint()
        createViewYellowConstraint()
        createViewGreenConstraint()
        createViewBlackConstraint()
    }
    
    private func createView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func createViewRedConstraint() {
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1 / 1).isActive = true
        redView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }
    
    private func createViewYellowConstraint() {
        yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor, multiplier: 1 / 1).isActive = true
        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 10).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalTo: greenView.heightAnchor).isActive = true
    }
    
    private func createViewGreenConstraint() {
        greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor, multiplier: 1 / 1).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 10).isActive = true
        greenView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        greenView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -38).isActive = true
    }
    
    private func createViewBlackConstraint() {
        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -10).isActive = true
        blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
    }
}

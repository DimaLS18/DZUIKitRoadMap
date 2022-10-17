//
//  ConstraintViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 17.10.2022.
//

import UIKit

/// Экран с  constraint  в коде
final class ConstraintViewController: UIViewController {

    // MARK: Constants
    private enum Constants {
        static let title = "ConstraintViewController"
    }

    // MARK: - Private Visual Components
    private lazy var redView = createView(size: 250, color: .red)
    private lazy var yellowView = createView(size: 250, color: .systemYellow)
    private lazy var greenView = createView(size: 250, color: .systemGreen)

    private let blackView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 270))
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
        createRedConstraint()
        createYellowConstraint()
        createGreenConstraint()
        createBlackConstraint()
    }

    private func createView(size: Int, color: UIColor) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    private func createRedConstraint() {
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .width,
                           multiplier: 1 / 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 10).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }

    private func createYellowConstraint() {
        NSLayoutConstraint(item: yellowView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .width,
                           multiplier: 1 / 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 10).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: greenView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }

    private func createGreenConstraint() {
        NSLayoutConstraint(item: greenView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: greenView,
                           attribute: .width,
                           multiplier: 1 / 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 10).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: -38).isActive = true
    }

    private func createBlackConstraint() {
        NSLayoutConstraint(item: blackView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .top,
                           multiplier: 1,
                           constant: -10).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .leading,
                           multiplier: 1,
                           constant: -10).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 10).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: greenView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 10).isActive = true
    }
}

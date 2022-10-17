//
//  StartViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 17.10.2022.
//

import UIKit
/// стартовый экран 
final class StartViewController: UIViewController {
    
    // MARK: Constants
    private enum Constants {
        static let title = "Start VC"
        static let constraintVCTitle = "Constraint VC"
        static let storyboardVCTitle = "Storyboard VC"
        static let anchorVCTitle = "Anchor VC"
        static let stackVCTitle = "Stack VC"
    }
    
    private lazy var constraintButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 190, height: 30))
        button.setTitle(Constants.constraintVCTitle, for: .normal)
        button.backgroundColor = .systemBlue
        button.tag = 0
        button.addTarget(self, action: #selector(showNewVCAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var storyboardButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 190, height: 30))
        button.setTitle(Constants.storyboardVCTitle, for: .normal)
        button.backgroundColor = .systemBlue
        button.tag = 1
        button.addTarget(self, action: #selector(showNewVCAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var anchorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 190, height: 30))
        button.setTitle(Constants.anchorVCTitle, for: .normal)
        button.backgroundColor = .systemBlue
        button.tag = 2
        button.addTarget(self, action: #selector(showNewVCAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 400, width: 190, height: 30))
        button.setTitle(Constants.stackVCTitle, for: .normal)
        button.backgroundColor = .systemBlue
        button.tag = 3
        button.addTarget(self, action: #selector(showNewVCAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = Constants.title
        view.addSubview(constraintButton)
        view.addSubview(storyboardButton)
        view.addSubview(anchorButton)
        view.addSubview(stackButton)
    }
    
    @objc func showNewVCAction(sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = ConstraintViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyBoard.instantiateViewController(
                withIdentifier: "StoryboardVC") as? StoryboardViewController else {return}
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = AnchorViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = StackViewController()
            navigationController?.pushViewController(vc, animated: true)
        default: break
        }
        
    }
}

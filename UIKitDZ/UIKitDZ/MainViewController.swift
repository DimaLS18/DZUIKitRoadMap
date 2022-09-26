//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
class MainViewController: UIViewController {

     let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
               button.layer.cornerRadius = 10
               button.setTitle("PLAY", for: .normal)
               button.layer.borderWidth = 5
               button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
               button.addTarget(self,
                                action: #selector(wordAllert),
                                for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let model = Word()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(wordLabel)
        view.addSubview(startButton)
    }

    @objc private func wordAllert() {

        let wordAllert = UIAlertController(title: "Привет",
                                           message: "введите leohl",
                                           preferredStyle: .alert)
        let wordAction = UIAlertAction(title: "Творим магию", style: .default) {_ in
            guard let text = wordAllert.textFields?.first?.text else { return}
            self.wordLabel.text = self.model.makeWord(word: text)
        }
        wordAllert.addTextField()
        wordAllert.addAction(wordAction)
        present(wordAllert, animated: true, completion: nil)
    }
}

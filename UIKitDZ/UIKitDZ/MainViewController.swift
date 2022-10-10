//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
final class MainViewController: UIViewController {

    // MARK: - Constants
    private enum Constants {
        static let timerText = "секунд"
        static let defaultTimerValue: Float = 0.0
        static let startButtonTitle = "Старт"
        static let pauseButtonTitle = "Пауза"
    }

    // MARK: - Private IBOutlets

    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var activateTimerButton: UIButton!

    // MARK: - Private properties
    private var timer: Timer?
    private var isTimerActive = false {
        didSet {
            setupTimerLogic(by: isTimerActive)
        }
    }
    private var currentTimerTime = Constants.defaultTimerValue {
        didSet {
            updateTimerLabel(with: currentTimerTime)
        }
    }

    // MARK: - Private Methods

    private func setupTimerLogic(by isTimerActive: Bool) {
        guard isTimerActive else {
            setupNonActiveTimer()
            return
        }
        setupActiveTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                     selector: #selector(updateTimerValue), userInfo: nil, repeats: true)
    }

    private func pauseTimer() {
        timer?.invalidate()
    }

    private func updateTimerLabel(with time: Float) {
        let time = String(format: "%.1f", currentTimerTime)
        timerLabel.text = "\(time) \(Constants.timerText)"
    }

    private func setupNonActiveTimer() {
        pauseTimer()
        activateTimerButton.setTitle(Constants.startButtonTitle, for: .normal)
        activateTimerButton.backgroundColor = .systemGreen
    }

    private func setupActiveTimer() {
        startTimer()
        activateTimerButton.setTitle(Constants.pauseButtonTitle, for: .normal)
        activateTimerButton.backgroundColor = .systemOrange
    }

    private func setupStoppedTimer() {
        currentTimerTime = Constants.defaultTimerValue
    }

    @objc private func updateTimerValue(_ sender: Timer) {
        currentTimerTime += Float(sender.timeInterval)
    }

    // MARK: - IBActions

    @IBAction private func activateTimerButtonAction(_ sender: UIButton) {
        isTimerActive.toggle()
    }

    @IBAction private func stopTimerButtonAction(_ sender: Any) {
        setupStoppedTimer()
        setupNonActiveTimer()
    }
}

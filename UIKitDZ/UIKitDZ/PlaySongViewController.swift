//
//  PlaySongViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 27.09.2022.
//
import AVFoundation
import UIKit
/// pleer VC
class PlaySongViewController: UIViewController {

    var song: Song?

    @IBOutlet weak var songCoverImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var currentPlayerValueLabel: UILabel!
    @IBOutlet weak var playerDurationLabel: UILabel!

    private lazy var player = AVAudioPlayer()
    var timer: Timer?

     override func viewDidLoad() {
         super.viewDidLoad()
         setupUI()

         configuratePlayerDurationLabel()
         createTimer()
         timeSlider.maximumValue = Float(player.duration)
     }

     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
     }

    func configuratePlayerDurationLabel() {
            var minutes = Int(player.duration / 60)
            let seconds = player.duration - Double(minutes * 60)
            var secondsString = seconds < 9.5 ? "0\(String(format: "%.0f", seconds))"
        : "\(String(format: "%.0f", seconds))"
            if secondsString == "60" {
                secondsString = "00"
                minutes += 1
            }
            playerDurationLabel.text = "\(minutes):\(secondsString)"
        }

     @IBAction func playButtonAction(_ sender: UIButton) {
         setupPlayer()
     }

     @IBAction func pauseButtonAction(_ sender: UIButton) {
         if player.isPlaying {
             player.pause()
         } else {
             player.play()
         }
     }

     @IBAction func restartButtonAction(_ sender: UIButton) {
         if player.isPlaying {
             timeSlider.value = 0
             player.currentTime = 0
             player.play()
         } else {
             player.play()
         }
     }

     @IBAction func volumeSliderAction(_ sender: UISlider) {
         player.volume = volumeSlider.value
     }

    @IBAction func dissmissButtonAction(_ sender: UIButton) {
        dismiss(animated: true)

    }

    @IBAction func shareButtonAction(_ sender: UIButton) {
         let activity = UIActivityViewController(
             activityItems: [song?.fullName ?? "nil"],
             applicationActivities: .none)
         present(activity, animated: true, completion: .none)
    }

 }

// MARK: - extension PlaySongViewController

private extension PlaySongViewController {

     func setupUI() {
         setSong()

     }

     func setSong() {
         guard let song = song else { return }
         songCoverImageView.image = UIImage(named: song.image)
         songNameLabel.text = song.name
         artistNameLabel.text = song.artist
     }

     func setupPlayer() {
         if player.isPlaying {
             playButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)
             player.stop()
         } else {
             playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
             guard let audioPath = Bundle.main.path(
                 forResource: song?.fullName,
                 ofType: "mp3"
             ) else { return }

             do {
                 try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                 timeSlider.maximumValue = Float(player.duration)
                 player.play()
             } catch {
                 print("Error")
             }
         }
     }

     @objc func updateTimer() {
             timeSlider.value = Float(player.currentTime)
             var minutes = Int(player.currentTime / 60)
             let seconds = player.currentTime - Double(minutes * 60)
             var secondsString = seconds < 9.5 ? "0\(String(format: "%.0f", seconds))"
         : "\(String(format: "%.0f", seconds))"
             if secondsString == "60" {
                 secondsString = "00"
                 minutes += 1
             }
             currentPlayerValueLabel.text = "\(minutes):\(secondsString)"
         }
         func createTimer() {
             if timer == nil {
                 timer = Timer.scheduledTimer(withTimeInterval: 1/5, repeats: true) { [weak self]_ in
                     self?.updateTimer()
                 }
             }
         }

         }

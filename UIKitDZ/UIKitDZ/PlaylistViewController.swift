//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
class PlaylistViewController: UIViewController {

    @IBOutlet weak var firstSongButton: UIButton!

    @IBOutlet weak var secondSongButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func firstSongButtonAction(_ sender: UIButton) {
        goToPlaySongViewController(song: Song(name: "Герман и Патрик",
                                              time: "4:31",
                                              image: "smoki",
                                              artist: "Смоки Мо ",
                                              fullName: "smokiMo - german")
        )
    }

    @IBAction func secondSongButtonAction(_ sender: Any) {
        goToPlaySongViewController(song: Song(name: "Биография",
                                              time: "3:13",
                                              image: "krovostok",
                                              artist: "Кровосток",
                                              fullName: "Krovostok-Bio"))
    }

    private func goToPlaySongViewController(song: Song) {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          guard let playSongViewController = storyboard.instantiateViewController(
              withIdentifier: "PlaySongViewController"
          ) as? PlaySongViewController else { return }
          playSongViewController.song = Song(
              name: song.name,
              time: song.time,
              image: song.image,
              artist: song.artist,
              fullName: song.fullName
          )
          playSongViewController.modalPresentationStyle = .formSheet
          present(playSongViewController, animated: true)
      }
}

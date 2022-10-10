//
//  ShopViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 05.10.2022.
//

import UIKit
/// экран магазина
final class ShopViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var segmentController: UISegmentedControl!

    private var images = [UIImage(named: "home"),
                          UIImage(named: "away")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func selectSegmantControllerAction(_ sender: UISegmentedControl) {
        guard imageView != nil else {
            fatalError("ImageView IBoutlet is not connected ")
        }
        let imageName = sender.selectedSegmentIndex == 0 ? "home" : "away"

        guard let imageShort = UIImage(named: imageName) else {
            fatalError("ImageView IBoutlet is not connected ")
        }
        imageView.image = imageShort
    }

    @IBAction func buyActionButton(_ sender: Any) {
        let alert = UIAlertController(title: "Заказ оплачен!",
                           message: "СПАРТАК МОСКВА БЛАГОДАРИТ ВАС ЗА ПОКУПКУ",
                           preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in 
        }))
        present(alert, animated: true)
    }

}

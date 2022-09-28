//
//  File.swift
//  TestXcodeProject
//
//  Created by Dima Kovrigin on 27.09.2022.
//

import Foundation
//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
class MainViewController: UIViewController {

    var segmentControll = UISegmentedControl()
    var imageView = UIImageView()

    var menuArray = ["one", "two", "three"]
    var imageArray = [UIImage(named: "iphone14"),
                      UIImage(named: "iphone14ProMax"),
                      UIImage(named: "iphone13ProMax")]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.segmentControll = UISegmentedControl(items: self.menuArray)
        self.segmentControll.frame = CGRect(x: 100, y: 500, width: 200, height: 30)
        self.view.addSubview(self.segmentControll)

        self.imageView.frame = CGRect(x: 50, y: 100, width: 300, height: 300)
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(imageView)

        self.segmentControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }

    @objc private func selectedValue(target: UISegmentedControl) {
        if target == self.segmentControll {
            let segmentIndex = target.selectedSegmentIndex

            self.imageView.image = self.imageArray[segmentIndex]
        }
    }
}

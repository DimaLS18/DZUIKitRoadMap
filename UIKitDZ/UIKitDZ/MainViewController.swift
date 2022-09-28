//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 22.09.2022.
//

import UIKit
/// начальный VC
class MainViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var sharePicker: UIPickerView!
    @IBOutlet weak var gradeSegment: UISegmentedControl!

    let pickerData = ["Футбол", "Хоккей", "Гиманастика"]

    override func viewDidLoad() {
        super.viewDidLoad()

        sharePicker.delegate = self
        sharePicker.dataSource = self

    }

    @IBAction func shareButtonTapped(_ sender: Any) {
        guard let grade = gradeSegment.titleForSegment(at: gradeSegment.selectedSegmentIndex),
         let name = nameTextfield.text,
         let image = UIImage(named: "olimp") else { return }
         let text = "Секция: " + grade + " Name: " + name
         let activityController = UIActivityViewController(activityItems: [image, text], applicationActivities: nil)
         present(activityController, animated: true)
     }
 }
extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {

     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         pickerData.count
     }

     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         pickerData[row]
     }

     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         guard row == 2 else { return }
         shareButtonTapped(self)
     }
 }

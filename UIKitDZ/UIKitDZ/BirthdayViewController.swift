//
//  BirthdayViewController.swift
//  UIKitDZ
//
//  Created by Dima Kovrigin on 26.09.2022.
//

import UIKit
/// второй контроллер
class BirthdayViewController: UIViewController {

    private var namePeopleOneLabel: UILabel = {
         let label = UILabel()
         label.text = "Jeremy"
         label.textColor = #colorLiteral(red: 0.1175499335, green: 0.1175499335, blue: 0.1175499335, alpha: 1)
         label.frame = CGRect(x: 80, y: 145, width: 80, height: 40)
         label.font = UIFont(name: "Arial Bold", size: 17)
         return label
     }()

     private var peopleOneImage: UIImageView = {
         let imageView = UIImageView()

         imageView.image = UIImage(systemName: "person.circle.fill")
         imageView.tintColor = .gray
         imageView.frame = CGRect(x: 30, y: 150, width: 50, height: 50)
         return imageView
     }()

     private var howManyYearsLabel: UILabel = {
         let label = UILabel()
         label.text = "10 марта, в среду исполнится 25 лет"
         label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
         label.frame = CGRect(x: 80, y: 163, width: 270, height: 40)
         label.font = UIFont(name: "Arial", size: 14)
         return label
     }()

     private var daysBeforeBirthdayLabel: UILabel = {
         let label = UILabel()
         label.text = "18 дней"
         label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
         label.frame = CGRect(x: 300, y: 145, width: 250, height: 40)
         label.font = UIFont(name: "Arial", size: 17)
         return label
     }()

     private var grayStripe: UIView = {
         var line = UIView()
         line.backgroundColor = .gray
         line.frame = CGRect(x: 10, y: 210, width: 500, height: 0.7)
         return line
     }()

    private var namePeopleTwoLabel: UILabel = {
            let label = UILabel()
            label.text = "Maria Lui"
            label.textColor = #colorLiteral(red: 0.1175499335, green: 0.1175499335, blue: 0.1175499335, alpha: 1)
            label.frame = CGRect(x: 80, y: 245, width: 80, height: 40)
            label.font = UIFont(name: "Arial Bold", size: 17)
            return label
        }()

        private var peopleTwoImage: UIImageView = {
            let imageView = UIImageView()

            imageView.image = UIImage(systemName: "person.circle.fill")
            imageView.tintColor = .gray
            imageView.frame = CGRect(x: 30, y: 250, width: 50, height: 50)
            return imageView
        }()

        private var howManyYearsPeopleTwoLabel: UILabel = {
            let label = UILabel()
            label.text = "30 марта, в четверг исполнится 20 лет"
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label.frame = CGRect(x: 80, y: 263, width: 270, height: 40)
            label.font = UIFont(name: "Arial", size: 14)
            return label
        }()

        private var daysBeforeBirthdayPeopleTwoLabel: UILabel = {
            let label = UILabel()
            label.text = "28 дней"
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label.frame = CGRect(x: 300, y: 245, width: 250, height: 40)
            label.font = UIFont(name: "Arial", size: 17)
            return label
        }()

        private var grayStripeTwo: UIView = {
            var line = UIView()
            line.backgroundColor = .gray
            line.frame = CGRect(x: 10, y: 310, width: 500, height: 0.7)
            return line
        }()

    private var namePeopleThreeLabel: UILabel = {
            let label = UILabel()
            label.text = "Jony Stark"
            label.textColor = #colorLiteral(red: 0.1175499335, green: 0.1175499335, blue: 0.1175499335, alpha: 1)
            label.frame = CGRect(x: 80, y: 345, width: 150, height: 40)
            label.font = UIFont(name: "Arial Bold", size: 17)
            return label
        }()

        private var peopleThreeImage: UIImageView = {
            let imageView = UIImageView()

            imageView.image = UIImage(systemName: "person.circle.fill")
            imageView.tintColor = .gray
            imageView.frame = CGRect(x: 30, y: 350, width: 50, height: 50)
            return imageView
        }()

        private var howManyYearsPeopleThreeLabel: UILabel = {
            let label = UILabel()
            label.text = "20 апреля, в субботу исполнится 25 лет"
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label.frame = CGRect(x: 80, y: 363, width: 270, height: 40)
            label.font = UIFont(name: "Arial", size: 14)
            return label
        }()

        private var daysBeforeBirthdayPeopleThreeLabel: UILabel = {
            let label = UILabel()
            label.text = "53 дней"
            label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label.frame = CGRect(x: 300, y: 345, width: 250, height: 40)
            label.font = UIFont(name: "Arial", size: 17)
            return label
        }()

        private var grayStripeThree: UIView = {
            var line = UIView()
            line.backgroundColor = .gray
            line.frame = CGRect(x: 10, y: 410, width: 500, height: 0.7)
            return line
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureView()
    }

    private func setupViews() {
        view.backgroundColor = .white
        navigationItem.title = "Birthday"

        view.addSubview(namePeopleOneLabel)
        view.addSubview(peopleOneImage)
        view.addSubview(howManyYearsLabel)
        view.addSubview(daysBeforeBirthdayLabel)
        view.addSubview(grayStripe)

        view.addSubview(namePeopleTwoLabel)
        view.addSubview(peopleTwoImage)
        view.addSubview(howManyYearsPeopleTwoLabel)
        view.addSubview(grayStripeTwo)

        view.addSubview(namePeopleThreeLabel)
        view.addSubview(peopleThreeImage)
        view.addSubview(howManyYearsPeopleThreeLabel)
        view.addSubview(grayStripeThree)
    }

    private func configureView() {
             view.backgroundColor = .white
             navigationItem.title = "Birthday"
             navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                      target: self,
                                                                      action: #selector(addAction))
    }
    @objc private func addAction() {
        let addVC = AddBirthdayViewController()
        addVC.modalTransitionStyle = .flipHorizontal
        self.present(addVC, animated: true)
    }

}

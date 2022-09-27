
import UIKit

 final class DetailViewController: UIViewController {

     // MARK: - UI Properties

     private lazy var itemImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 500)
         imageView.contentMode = .scaleAspectFit
         imageView.image = UIImage(named: imageName)
         return imageView
     }()

     private let sizeLabel: UILabel = {
         let label = UILabel()
         label.text = "Select size"
         label.textColor = .black
         label.frame = CGRect(x: 40, y: 600, width: 200, height: 30)
         label.font = UIFont.boldSystemFont(ofSize: 16)
         return label
     }()

     private let sizeSegment:UISegmentedControl = {
         let segment = UISegmentedControl(items: ["S", "M", "L", "XL", "XXL"])
         segment.selectedSegmentIndex = 3
         segment.frame = CGRect(x: 40, y: 630, width: 300, height: 50)
         return segment
     }()

     private lazy var cartButton:UIButton = {
         let button = UIButton()
         button.frame = CGRect(x: 40, y: 720, width: 300, height: 50)
         button.backgroundColor = .black
         button.setTitle("Add to cart", for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
         return button
     }()

     // MARK: - Private properties

     private var imageName: String

     // MARK: - Init
     init(imageName: String) {
         self.imageName = imageName
         super.init(nibName: nil, bundle: nil)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     // MARK: - UIViewController

     override func viewDidLoad() {
         super.viewDidLoad()

         setupView()
     }

     // MARK: - Private methods

     private func setupView() {
         view.backgroundColor = .white
         view.addSubview(itemImageView)
         navigationController?.navigationBar.topItem?.title = " "
         navigationController?.navigationBar.tintColor = .black
         view.addSubview(cartButton)
         view.addSubview(sizeLabel)
         view.addSubview(sizeSegment)
     }

     @objc private func cartButtonTapped() {
         let cardVC = CardViewController()
         navigationController?.pushViewController(cardVC, animated: true)
     }
 }

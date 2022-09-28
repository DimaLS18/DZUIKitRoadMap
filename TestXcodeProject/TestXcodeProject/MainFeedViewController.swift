import UIKit
final class MainFeedViewController: UIViewController {
    // MARK: UIProperties
    private let menuButton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        button.frame = CGRect(x: 20, y: 100, width: 35, height: 25)
        button.tintColor = .black
        return button
    }()
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.frame = CGRect(x: 300, y: 100, width: 25, height: 25)
        button.tintColor = .black
        return button
    }()
    private let bucketButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "bag.circle"), for: .normal)
        button.frame = CGRect(x: 340, y: 100, width: 25, height: 25)
        button.tintColor = .black
        return button
    }()
    private let styleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find your style"
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 20, y: 150, width: 200, height: 50)
         return label
     }()


    private lazy var firstImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.frame = CGRect(x: 20, y: 250, width: 115, height: 200)
         imageView.contentMode = .scaleAspectFit
         imageView.isUserInteractionEnabled = true
         let gestureRecognizer = UITapGestureRecognizer()
         gestureRecognizer.addTarget(self, action: #selector(selectFirstItem))
         imageView.addGestureRecognizer(gestureRecognizer)
         return imageView
     }()


    private lazy var secondImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.frame = CGRect(x: 140, y: 250, width: 115, height: 200)
         imageView.contentMode = .scaleAspectFit
         imageView.isUserInteractionEnabled = true
         let gestureRecognizer = UITapGestureRecognizer()
         gestureRecognizer.addTarget(self, action: #selector(selectSecondItem))
         imageView.addGestureRecognizer(gestureRecognizer)
         return imageView
     }()


    private lazy var thirdImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.frame = CGRect(x: 260, y: 250, width: 115, height: 200)
         imageView.contentMode = .scaleAspectFit
         imageView.isUserInteractionEnabled = true
         let gestureRecognizer = UITapGestureRecognizer()
         gestureRecognizer.addTarget(self, action: #selector(selectThirdItem))
         imageView.addGestureRecognizer(gestureRecognizer)
         return imageView
     }()

    lazy private var styleSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: styleSegments)
        segment.frame = CGRect(x: 20, y: 200, width: 350, height: 40)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(selectStyle), for: .valueChanged)
        return segment
    }()
    // MARK: - Private properties
    private let styleSegments = ["All", "Men", "Women", "Shoes", "Kids"]
    private var selectedIndex = 0 {
        didSet {
            setImages()
        }
    }
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

     // MARK: - Private methods
     private func setupView() {
         view.backgroundColor = .white
         view.addSubview(menuButton)
         view.addSubview(searchButton)
         view.addSubview(bucketButton)
        view.addSubview(styleLabel)
        view.addSubview(styleSegment)
        view.addSubview(firstImageView)
        view.addSubview(secondImageView)
        view.addSubview(thirdImageView)
        setImages()
    }
    private func setImages() {
        firstImageView.image = UIImage(named: styleSegments[selectedIndex])
        secondImageView.image = UIImage(named: styleSegments[selectedIndex] + "2")
         thirdImageView.image = UIImage(named: styleSegments[selectedIndex] + "3")
     }

     private func openDetails(imageName: String) {
         let detailsVC = DetailViewController(imageName: imageName)
         navigationController?.pushViewController(detailsVC, animated: true)
     }

     @objc private func selectStyle(_ sender: UISegmentedControl) {
         selectedIndex = sender.selectedSegmentIndex
     }

     @objc private func selectFirstItem(_ sender: UITapGestureRecognizer) {
         openDetails(imageName: styleSegments[selectedIndex])
     }

     @objc private func selectSecondItem(_ sender: UITapGestureRecognizer) {
         openDetails(imageName: styleSegments[selectedIndex] + "2")
     }

     @objc private func selectThirdItem(_ sender: UITapGestureRecognizer) {
         openDetails(imageName: styleSegments[selectedIndex] + "3")
     }
 }

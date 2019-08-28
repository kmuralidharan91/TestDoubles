import UIKit

final class HomeViewController: UIViewController, HomeDisplayer {
    private let label = UILabel()
    private let imageView = UIImageView()
    
    private var presenter: HomePresenter?
    private let navigator: HomeNavigator
    private var listener: HomeActionListener?
    
    init(navigator: HomeNavigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        self.presenter = HomePresenter(displayer: self,
                                       navigator: navigator,
                                       repository: DefaultAuthorizerRepository())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "HomeViewController"
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(imageView)
        
        setupBarButton()
        setupLabel()
        setupImageView()
    }
    
    private func setupBarButton() {
        let logInItem = UIBarButtonItem(title: "Login",
                                        style: .done,
                                        target: self,
                                        action: #selector(loginInAction))
        navigationItem.rightBarButtonItem = logInItem
    }
    
    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1.0).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 1.0).isActive = true
        label.font = UIFont.systemFont(ofSize: 30.0)
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1.0).isActive = true
        imageView.image = UIImage(named: "SwiftLogo")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.startPresenting()
    }
    
    func attachListener(listener: HomeActionListener) {
        self.listener = listener
    }
    
    func detachListener() {
        self.listener = nil
    }
    
    func update(with name: String) {
        label.text = name
    }
    
    @objc func loginInAction() {
        listener?.loginButtonTap()
    }
    
    deinit {
        presenter?.stopPresenting()
    }
}


import Foundation
import UIKit

final class MainNavigator: NSObject {
    fileprivate var window: UIWindow?
    private var navigationController: UINavigationController?
    
    func toStart(inWindow mainWindow: UIWindow) {
        let viewController = HomeViewController(navigator: self)
        navigationController = UINavigationController(rootViewController: viewController)
        
        window = mainWindow
        window?.backgroundColor = .white
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

extension MainNavigator: HomeNavigator {
    func toLoginPage() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}

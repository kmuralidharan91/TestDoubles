import Foundation

protocol AuthorizerRepository {
    func authorize(username: String, password: String) -> Bool
}

final class DefaultAuthorizerRepository: AuthorizerRepository {
    func authorize(username: String, password: String) -> Bool {
        return false
    }
}

struct HomeActionListener {
    let loginButtonTap: () -> Void
}

protocol HomeDisplayer {
    func attachListener(listener: HomeActionListener)
    func detachListener()
    func update(with name: String)
}

protocol HomeNavigator: class {
    func toLoginPage()
}

final class HomePresenter {
    private let displayer: HomeDisplayer
    private let navigator: HomeNavigator
    private let repository: AuthorizerRepository
    
    init(displayer: HomeDisplayer,
         navigator: HomeNavigator,
         repository: AuthorizerRepository) {
        self.displayer = displayer
        self.navigator = navigator
        self.repository = repository
    }
    
    func startPresenting() {
        displayer.attachListener(listener: makeListener())
        
        if repository.authorize(username: "Murali", password: "Password") {
            displayer.update(with: "Murali")
        } else {
            displayer.update(with: "Guest User")
        }
    }
    
    func makeListener() -> HomeActionListener {
        return HomeActionListener(loginButtonTap: {
            self.loginButtonAction()
        })
    }
    
    func stopPresenting() {
        displayer.detachListener()
    }
    
    private func loginButtonAction() {
        navigator.toLoginPage()
    }
}

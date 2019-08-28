@testable import TestDoubles

final class HomeNavigatorDummy: HomeNavigator {
    func toLoginPage() {}
}

final class HomeNavigatorSpy: HomeNavigator {
    var loginButtonTapped = 0

    func toLoginPage() {
        loginButtonTapped += 1
    }
}

final class HomeNavigatorMock: HomeNavigator {
    var loginButtonTapped = 0
    
    func toLoginPage() {
        loginButtonTapped += 1
    }
    
    func verify() -> Bool {
        return loginButtonTapped == 1
    }
}


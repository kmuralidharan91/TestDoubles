@testable import TestDoubles

final class AuthorizerDummy: AuthorizerRepository {
    func authorize(username: String, password: String) -> Bool {
        return false
    }
}

final class AuthorizerStub: AuthorizerRepository {
    let status: Bool
    
    init(status: Bool) {
        self.status = status
    }
    
    func authorize(username: String, password: String) -> Bool {
        return status
    }
}

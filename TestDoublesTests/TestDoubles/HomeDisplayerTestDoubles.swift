@testable import TestDoubles

class HomeDisplayerStub: HomeDisplayer {
    var name: String?
    
    func update(with name: String) {
        self.name = name
    }
    
    func attachListener(listener: HomeActionListener) {
        
    }
    
    func detachListener() {
        
    }
}

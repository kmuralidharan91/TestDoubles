import XCTest
@testable import TestDoubles

class HomePresenterTests: XCTestCase  {
    
    func test_UserName_WhenAuthorizationIsNotDoneInitially() {
        let displayer = HomeDisplayerStub()
        let presenter = HomePresenter(displayer: displayer,
                                      navigator: HomeNavigatorDummy(),
                                      repository: AuthorizerDummy())
        
        presenter.startPresenting()
        XCTAssertEqual("Guest User", displayer.name)
    }
    
    func test_UserName_WhenAuthorizationGotFailed() {
        let displayer = HomeDisplayerStub()
        let presenter = HomePresenter(displayer: displayer,
                                      navigator: HomeNavigatorDummy(),
                                      repository: AuthorizerStub(status: false))
        presenter.startPresenting()
        XCTAssertEqual("Guest User", displayer.name)
    }
    
    func test_UserName_WhenAuthorizationIsPassed() {
        let displayer = HomeDisplayerStub()
        let presenter = HomePresenter(displayer: displayer,
                                      navigator: HomeNavigatorDummy(),
                                      repository: AuthorizerStub(status: true))
        presenter.startPresenting()
        XCTAssertEqual("Murali", displayer.name)
    }
    
    func test_TapOnLoginButton() {
        let displayer = HomeDisplayerStub()
        let navigator = HomeNavigatorSpy()
        let presenter = HomePresenter(displayer: displayer,
                                      navigator: navigator,
                                      repository: AuthorizerStub(status: true))
        presenter.startPresenting()
        navigator.toLoginPage()
        XCTAssertEqual(navigator.loginButtonTapped, 1)
    }
    
    func test_TapOnLoginButton_With_Mock() {
        let displayer = HomeDisplayerStub()
        let navigator = HomeNavigatorMock()
        let presenter = HomePresenter(displayer: displayer,
                                      navigator: navigator,
                                      repository: AuthorizerStub(status: true))
        presenter.startPresenting()
        navigator.toLoginPage()
        XCTAssert(navigator.verify())
    }

}






















//XCTAssertEqual(displayer.name, "Guest User")







//XCTAssertEqual(displayer.name, "Guest User")








//XCTAssertEqual(displayer.name, "Murali")









//XCTAssertEqual(navigator.loginButtonTapped, 1)









//XCTAssert(navigator.verify())

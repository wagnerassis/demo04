import Quick
import Nimble

@testable import Demo4all

final class HomePresenterTests: QuickSpec {
    
    override func spec() {
        
        var sut_presenter: HomePresenter!
        var delegate: HomeDelegateSpy!
        let placeId = "primeiro"
        
        describe("HomePresenter") {
            
            beforeEach {
                delegate = HomeDelegateSpy()
                sut_presenter = HomePresenter(delegate: delegate)
            }
            
            describe("quando goToDetail for acionado") {
                
                beforeEach {
                    sut_presenter.goToDetail(placeID: placeId, viewController: UIViewController())
                }
                it("então deverá chamar tela servicos") {
                    expect(delegate.tapToDetailCalled).to(beTrue())
                    expect(delegate.placeIdPassed).to(equal("primeiro"))
                }
            }
        }
    }
}

class HomeDelegateSpy: HomeDelegate {
    var tapToDetailCalled: Bool?
    var placeIdPassed: String?
    
    func tapToDetail(placeID: String, viewController: UIViewController) {
        tapToDetailCalled = true
        placeIdPassed = placeID
    }
}

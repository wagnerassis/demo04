import Quick
import Nimble

@testable import Demo4all

final class HomeRouterTests: QuickSpec {
    
    override func spec() {
        
        var sut_router: HomeRouter!
        
        describe("HomeRouter") {
            
            beforeEach {
                sut_router = HomeRouter()
            }
            
            describe("quando for construir uma `viewController`") {
                
                it("então deverá retornar `HomeViewController`") {
                    expect(sut_router.createModule() is HomeViewController) == true
                    expect(sut_router?.createModule().view).toNot(beNil())
                }
            }
        }
    }
}


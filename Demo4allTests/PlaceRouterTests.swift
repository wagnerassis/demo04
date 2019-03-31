import Quick
import Nimble

@testable import Demo4all

final class PlaceRouterTests: QuickSpec {
    
    override func spec() {
        
        var sut_router: PlaceRouter!
        let placeId = "primeiro"
        
        describe("PlaceRouter") {
            
            beforeEach {
                sut_router = PlaceRouter()
            }
            
            describe("quando for construir uma `viewController`") {
                
                it("então deverá retornar `HomeViewController`") {
                    expect(sut_router.createModule(placeId: placeId) is PlaceViewController) == true
                    expect(sut_router?.createModule(placeId: placeId).view).toNot(beNil())
                }
            }
        }
    }
}


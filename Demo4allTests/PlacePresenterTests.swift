import Quick
import Nimble

@testable import Demo4all

final class PlacePresenterTests: QuickSpec {
    
    override func spec() {

        var sut_presenter: PlacePresenter!
        var delegate: PlaceDelegateSpy!
        var view: PlaceViewStub!
        let placeId = "primeiro"
        
        describe("PlacePresenter") {
            
            beforeEach {
                delegate = PlaceDelegateSpy()
                sut_presenter = PlacePresenter(placeId: placeId, delegate: delegate)
                view = PlaceViewStub()
                sut_presenter.attachView(view)
            }
            
            describe("quando presenter for iniciada") {
                beforeEach {
                    view.setHeaderTitle(title: "hoje")
                    view.setComments(comments: [Comentario]())
                }
                
                it("então deverá chamar o attachView") {
                    expect(view.setHeaderTitleCalled).to(beTrue())
                    expect(view.setHeaderTitleText).to(equal("hoje"))
                    expect(view.setCommentsCalled).to(beTrue())
                }
            }
            
            describe("quando tapToService for acionado") {
                
                beforeEach {
                    sut_presenter.goToServices(viewController: UIViewController())
                }
                it("então deverá chamar tela servicos") {
                    expect(delegate.tapToServiceCalled).to(beTrue())
                }
            }
        }
    }
}

class PlaceViewStub: PlaceView {
    var setHeaderTitleCalled: Bool?
    var setHeaderTitleText: String?
    var setPlaceDetailViewCalled: Bool?
    var setCommentsCalled: Bool?
    
    func setHeaderTitle(title: String) {
        setHeaderTitleText = title
        setHeaderTitleCalled = true
    }
    
    func setPlaceDetailView(place: Place) {
        setPlaceDetailViewCalled = true
    }
    
    func setComments(comments: [Comentario]) {
        setCommentsCalled = true
    }
}

class PlaceDelegateSpy: PlaceDelegate {
    var tapToServiceCalled: Bool?
    
    func tapToService(viewController: UIViewController) {
        tapToServiceCalled = true
    }
}

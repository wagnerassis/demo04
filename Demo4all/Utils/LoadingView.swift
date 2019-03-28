import PKHUD

struct LoadingView {
    static func show() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    static func dismiss() {
        PKHUD.sharedHUD.hide(true)
    }
    
    static func showSuccess() {
        PKHUD.sharedHUD.contentView = PKHUDSuccessView(title: "Salvo com sucesso", subtitle: "")
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 1)
    }
}

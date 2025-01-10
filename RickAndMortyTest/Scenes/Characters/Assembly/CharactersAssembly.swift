import UIKit

final class CharactersAssembly {
    
    func assemble() -> UIViewController {
        
        let viewController = CharactersViewController()
        let presenter = CharactersPresenter()
        presenter.view = viewController
        viewController.output = presenter
        
        return viewController
    }
    
}

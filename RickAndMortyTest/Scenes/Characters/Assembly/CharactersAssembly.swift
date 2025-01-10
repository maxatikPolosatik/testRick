import UIKit
import Factory

final class CharactersAssembly {
    
    func assemble() -> UIViewController {
        
        let viewController = CharactersViewController()
        let presenter = CharactersPresenter(charactersClient: Container.shared.charactersClient())
        presenter.view = viewController
        viewController.output = presenter
        
        return viewController
    }
    
}

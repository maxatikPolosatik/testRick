import UIKit

final class CharactersViewController: UIViewController, CharactersViewInput {
    
    var output: BankStatementViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
}

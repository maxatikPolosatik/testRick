import Foundation

final class CharactersPresenter: BankStatementViewOutput {
    
    weak var view: CharactersViewInput?
    var charactersClient:  CharactersApiClientProtocol?
    
    init(charactersClient: CharactersApiClientProtocol) {
        self.charactersClient = charactersClient
    }
    
    func viewIsReady() {
        Task { @MainActor in
            do {
                let characters = try await CharactersApiClient().getCharacters()
                print(characters)
                view?.reload(characters: characters.characters)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

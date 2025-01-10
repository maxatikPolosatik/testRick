import Factory

extension Container {
    var charactersClient: Factory<CharactersApiClientProtocol> {
        self {
            CharactersApiClient()
        }.singleton
    }

    func resetContainers() {
        charactersClient.reset()
    }
}

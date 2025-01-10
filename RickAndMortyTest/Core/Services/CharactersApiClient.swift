import Foundation
import SwiftyJSON
import Get

protocol CharactersApiClientProtocol {
    func getCharacters() async throws -> CharactersResponse
}

final class CharactersApiClient: BaseApiClient {}

extension CharactersApiClient: CharactersApiClientProtocol {
    
    func getCharacters() async throws -> CharactersResponse {
        let r = Request(path: "/character", method: .get)
        let response = try await client.send(r)
        let json = try JSON(data: response.data)
        return CharactersResponse(json: json)
    }
}

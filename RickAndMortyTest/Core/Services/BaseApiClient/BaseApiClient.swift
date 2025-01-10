import Get
import Foundation

class BaseApiClient {
    
    final let client: APIClient
    
    init() {
        self.client = APIClient(baseURL: URL(string: "https://rickandmortyapi.com/api")) { config in
//            config.delegate = ApiErrorHandler(codes: [:], authRequired: false)
        }
    }
}


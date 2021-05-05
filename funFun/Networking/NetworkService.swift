//
//  NetworkService.swift
//  funFun
//
//  Created by Vlad Tretiak on 05/05/2021.
//

import Foundation

class NetworkService {
    
    func request<T: Decodable>(router: Router, model: T.Type, completion: @escaping (Result<T, Error>) -> ()) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        
        let session = URLSession(configuration: .default)
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
//        urlRequest.allHTTPHeaderFields = router.header
        urlRequest.httpMethod = router.method
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard let data = data, error == nil else {
                completion( .failure(FetchError.failed))
                return
            }
            
            guard let object = self.decodeJSON(type: model.self, from: data) else {
                completion( .failure(FetchError.failed))
                return
            }
            completion(.success(object))
        }
        dataTask.resume()
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}


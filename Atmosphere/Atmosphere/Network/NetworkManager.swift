//
//  NetworkManager.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import Foundation

final class NetworkManager<T: Codable> {
    static func fetchUrl(for url : URL, completion: @escaping(Result<T, NetworkErr> ) -> Void ){
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(err: error?.localizedDescription ?? "unkown error")))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(jsonData))
            }catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
            
            
        }
        .resume()
        
    }
    
}

enum NetworkErr : Error {
    case invalidURIError
    case invalidData
    case invalidResponse
    case error(err: String)
    case decodingError(err: String)
}

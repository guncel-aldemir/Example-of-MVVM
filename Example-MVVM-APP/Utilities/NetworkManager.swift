//
//  NetworkManager.swift
//  Example-MVVM-APP
//
//  Created by guncel on 2.07.2023.
//

import Foundation
enum NetworkError: Error {
    case serverError
    case invalidURL
    case emptyResponse
}
class NetworkManager {
    static let shared = NetworkManager()
    private init(){
        
    }
    
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        URLSession.shared.dataTask(with:url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
            response.statusCode == 200   else {
                completion(.failure(NetworkError.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.emptyResponse))
                return
            }

            completion(.success(data))
        }
    }
    
    
}

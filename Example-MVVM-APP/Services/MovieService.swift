//
//  MovieService.swift
//  Example-MVVM-APP
//
//  Created by guncel on 2.07.2023.
//

import Foundation


class MovieService {
    
    
    func downloadMovies(completion: @escaping ([MovieResult]?) -> ()){
        guard let url = URL(string: APIURLS.movies(page: 1)) else{return}
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else{return}
            switch result {
                
            case .success(let data):
               completion(self.handleWithSuccess(data: data))
            case .failure(let error):
                self.handleWithError(error: error)
                
            }
        }
    }
    private func handleWithError(error:Error){
        print(error.localizedDescription)
    }
    private func handleWithSuccess(data:Data) -> [MovieResult]? {
        do {
            let moviesList = try JSONDecoder().decode(Movies.self, from: data)
    
                return moviesList.results
       
        }
        catch{
            print(error)
            return nil
        }
    }
}




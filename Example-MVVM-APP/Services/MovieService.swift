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
  
        NetworkManager.shared.download(url:url) { [weak self] results in
            guard let self = self else{return}
          
            switch results {
                /*
                 switch ifadesinde result değeri kontrol edilirken, Result türündeki dönüş değerini desen eşleme (pattern matching) yapısı kullanarak işlenir. Bu desen eşleme yapısı, result değerinin .success durumunda veri (data) içerdiğini ve .failure durumunda hata (error) içerdiğini kontrol eder.
                 */
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
            print(moviesList)
                return moviesList.results
          
        }
        catch{
            print("data boş")
            return nil
        }
    }
}




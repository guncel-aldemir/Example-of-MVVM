//
//  HomeViewModel.swift
//  Example-MVVM-APP
//
//  Created by guncel on 5.07.2023.
//

import Foundation


protocol HomeViewModelProtocol{
    
    var view:HomeViewControllerProtocol? { get set }
    
    func viewDidLoad()
    
    func getMovies()
}


final class HomeViewModel{
    weak var view : HomeViewControllerProtocol?
  
   private let service = MovieService()
    
    var moviesLists : [MovieResult] = []
}

extension HomeViewModel:HomeViewModelProtocol{
    
    
    
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    func getMovies() {
        service.downloadMovies { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
            
            self.moviesLists = returnedMovies
            print(returnedMovies)
        }
    }
    
}

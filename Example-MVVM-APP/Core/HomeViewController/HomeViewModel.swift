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
    
    
}

extension HomeViewModel:HomeViewModelProtocol{
    
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
    }
    
    func getMovies() {
        service.downloadMovies { [weak self] returnedMovies in
            guard let self = self else{return}
            
        }
    }
}

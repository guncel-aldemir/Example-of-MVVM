//
//  HomeViewController.swift
//  Example-MVVM-APP
//
//  Created by guncel on 2.07.2023.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject{
    func configureVC()
    
    func configureCollectionView()
}


final class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
       
        viewModel.viewDidLoad()
        
        
        
    }
    
    
}

extension HomeViewController: HomeViewControllerProtocol{
    
    func configureVC() {
        view.backgroundColor = .systemBackground

        
    }
    // MARK: - Collection
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        
        view.addSubview(collectionView)
        
        // MARK: - Delegate-datasource
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseId)
        
        
        // MARK: - Layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.pinToEdgesOf(view: view)
        collectionView.backgroundColor = .systemBackground
        
    }
    
    
}


extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.moviesLists.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseId, for: indexPath) as! MovieCell
        cell.setCell(moviePicture: viewModel.moviesLists[indexPath.item])
        return cell
    }
  
    
}

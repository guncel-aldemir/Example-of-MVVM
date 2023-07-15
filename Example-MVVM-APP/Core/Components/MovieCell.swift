//
//  MovieCell.swift
//  Example-MVVM-APP
//
//  Created by guncel on 8.07.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    private var posterImageView: MoviesImageView!
     static let reuseId = "MovieCell"
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePosterImageView()
        
    }
    
    func setCell(moviePicture:MovieResult){
        posterImageView.downloadImages(movieImage: moviePicture)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureCell(){
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
       
        
    }
    private func configurePosterImageView(){
        posterImageView = MoviesImageView(frame: .zero)
        addSubview(posterImageView)
        posterImageView.pinToEdgesOf(view: self)
        backgroundColor = .green
        
    }
}

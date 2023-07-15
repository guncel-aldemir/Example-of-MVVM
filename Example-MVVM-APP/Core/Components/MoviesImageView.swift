//
//  MoviesImageView.swift
//  Example-MVVM-APP
//
//  Created by guncel on 15.07.2023.
//

import UIKit

class MoviesImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImages(movieImage:MovieResult){
        guard let url = URL(string: APIURLS.imageUrl(posterPath: movieImage._posterPath )) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _ , _ in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

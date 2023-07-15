//
//  APIURLS.swift
//  Example-MVVM-APP
//
//  Created by guncel on 2.07.2023.
//

import Foundation


enum APIURLS {
    
    static func movies(page: Int) -> String {
    "https://api.themoviedb.org/3/movie/popular?api_key=28f5c7cf8dad0f5aa725c0f4951949ba&language=en-USpage=\(page)"
        
    }
    
    static func imageUrl(posterPath:String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath).jpeg"
    }
}


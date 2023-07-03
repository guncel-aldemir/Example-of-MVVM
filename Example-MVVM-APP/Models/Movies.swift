//
//  Movies.swift
//  Example-MVVM-APP
//
//  Created by guncel on 2.07.2023.
//

import Foundation


struct Movies: Decodable{
    let page: Int?
    let results: [MovieResult]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {

      case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieResult: Decodable {
    let id : Int?
    let posterPath : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}

//
//  UIHelper.swift
//  Example-MVVM-APP
//
//  Created by guncel on 8.07.2023.
//

import UIKit

enum UIHelper {
    
    static func createHomeFlowLayout()-> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        
       let itemWidth = CGFloat.dWidth
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 30
        return layout
    }
}

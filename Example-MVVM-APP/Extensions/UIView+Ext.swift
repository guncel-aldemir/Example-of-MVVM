//
//  UIView+Ext.swift
//  Example-MVVM-APP
//
//  Created by guncel on 7.07.2023.
//

import UIKit


extension UIView {
    
    func pinToEdgesOf(view:UIView){
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

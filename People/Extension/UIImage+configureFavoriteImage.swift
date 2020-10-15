//
//  UIImage+configureFavoriteImage.swift
//  People
//
//  Created by Hector Villasano on 10/14/20.
//

import UIKit

fileprivate let favoriteImageName = "heart"

extension UIImage {
    static func fetchFavoriteUIImage(_ isFavorite: Bool) -> UIImage {
        let systemImageName = isFavorite ? favoriteImageName + ".fill" : favoriteImageName
        
        guard let image = UIImage(systemName: systemImageName) else {
            fatalError("fetchFavoriteUIImagesystem: image name is invalid")
        }
        
        return image
    }
    
}

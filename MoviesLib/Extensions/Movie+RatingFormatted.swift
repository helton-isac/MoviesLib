//
//  ViewController.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 24/09/20.
//

import Foundation
import UIKit

extension Movie {
    var ratingFormatted: String {
        "⭐️ \(rating)/10"
    }
    
    var poster: UIImage? {
        if let data = image {
            return UIImage(data:data)
        }
        return nil
    }
}

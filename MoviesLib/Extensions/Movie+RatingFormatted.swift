//
//  ViewController.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 24/09/20.
//

import Foundation

extension Movie {
    var ratingFormatted: String {
        "⭐️ \(rating ?? 0)/10"
    }
}

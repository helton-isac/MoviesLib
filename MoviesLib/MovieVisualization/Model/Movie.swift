//
//  Movie.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 24/09/20.
//

struct Movie: Decodable {
    
    let title: String?
    let categories: String?
    let duration: String?
    let rating: Double?
    let summary: String?
    let image: String?

}

//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 24/09/20.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelSummary: UILabel!
    
    // MARK: - Methods
    func configure(with movie: Movie) {
        if let image = movie.image {
            imageViewPoster.image = UIImage(named: image)
        } else {
            imageViewPoster.image = nil
        }
        //imageViewPoster.image = UIImage(named: movie.image ?? "placeholder")
        labelTitle.text = movie.title
        labelRating.text = movie.ratingFormatted
        labelSummary.text = movie.summary
    }

}

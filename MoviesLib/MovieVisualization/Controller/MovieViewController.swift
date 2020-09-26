//
//  ViewController.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 24/09/20.
//

import UIKit

final class MovieViewController: UIViewController {
    
    // MARK: - Properties
    var movie: Movie!
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelTitle.text = movie.title
        labelRating.text = movie.ratingFormatted
        labelDuration.text = movie.duration
        textViewSummary.text = movie.summary
        imageViewPoster.image = movie.poster
        labelCategories.text = (movie.categories as? Set<Category>)?.compactMap({$0.name}).sorted().joined(separator: " | ")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieFormViewController {
            vc.movie = movie
        }
    }
    
    // MARK: - IBActions
}

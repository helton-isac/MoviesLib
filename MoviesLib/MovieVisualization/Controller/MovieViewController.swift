//
//  ViewController.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 24/09/20.
//

import UIKit
import AVKit

final class MovieViewController: UIViewController {
    
    // MARK: - Properties
    var movie: Movie!
    var moviePlayer: AVPlayer?
    var moviePlayerController: AVPlayerViewController?
    var trailer: String = ""
    
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
        
        if let title = movie.title {
            loadTrailer(with: title)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieFormViewController {
            vc.movie = movie
        }
    }
    
    // MARK: - Methods
    private func loadTrailer(with title: String){
        let itunesPath = "https://itunes.apple.com/search?media=movie&entity=movie&term="
        
        guard let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let url = URL(string: "\(itunesPath)\(encodedTitle)")
        else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let apiResult = try! JSONDecoder().decode(ItunesResult.self, from: data!)
            self.trailer = apiResult.results.first?.previewUrl ?? ""
            self.prepareVideo()
        }.resume()
    }
    
    // MARK: - IBActions
    @IBAction func playTrailer(_ sender: UIButton) {
        guard let moviePlayerController = moviePlayerController else { return }
        present(moviePlayerController, animated: true) {
            self.moviePlayer?.play()
        }
        
    }
    
    private func prepareVideo() {
        guard let url = URL(string: trailer) else {return}
        moviePlayer = AVPlayer(url: url)
        DispatchQueue.main.async {
            self.moviePlayerController = AVPlayerViewController()
            self.moviePlayerController?.player = self.moviePlayer
        }
        
    }
}

struct ItunesResult: Codable {
    let results: [MovieInfo]
}

struct MovieInfo: Codable {
    let previewUrl: String
}

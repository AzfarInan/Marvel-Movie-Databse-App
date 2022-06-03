//
//  MovieCell.swift
//  Marvel Movie Database App
//
//  Created by BS851 on 3/6/22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieDetails: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func setMovie(movie: MovieData) {
        movieTitle.text = movie.title
        movieDetails.text = movie.detail
        
        movieDetails.lineBreakMode = .byWordWrapping
        movieDetails.numberOfLines = 0
        
        movieTitle.lineBreakMode = .byWordWrapping
        movieTitle.numberOfLines = 0
        
        load(url: URL(string: movie.getImageURL)!)
    }
    
    func load(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//
//  MovieSummaryTableViewCell.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 09/11/21.
//

import UIKit

class MovieSummaryTableViewCell: UITableViewCell {
    
    static let identifier = "MovieSummaryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var movie: Movie?
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieReleaseDate: UILabel!
    @IBOutlet var movieOverview: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension MovieSummaryTableViewCell {
    
    func initView() {
        movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w300/\(movie?.posterPath ?? "")"), completed: nil)
        movieTitle.text = movie?.title ?? "-"
        movieReleaseDate.text = "Released Date: \(movie?.releaseDate ?? "-")"
        movieOverview.text = movie?.overview ?? "-"
    }
}

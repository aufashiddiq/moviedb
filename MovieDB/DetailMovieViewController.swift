//
//  DetailMovieViewController.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 21/04/21.
//

import UIKit

class DetailMovieViewController: UIViewController {

    var movieTitle: String = ""
    var movieImageUrl: String = ""
    @IBOutlet var movieImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = movieTitle + " Movie"
        movieImage.sd_setImage(with: URL(string: movieImageUrl), completed: nil)
        view.backgroundColor = .white
    }

}

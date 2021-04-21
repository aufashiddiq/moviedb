//
//  DetailMovieViewController.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 21/04/21.
//

import UIKit

class DetailMovieViewController: UIViewController {

    var movieTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = movieTitle + " Movie"
        view.backgroundColor = .white
    }

}

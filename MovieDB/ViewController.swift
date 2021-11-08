//
//  ViewController.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 08/04/21.
//

import SDWebImage
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieTableViewCellDelegate {

    @IBOutlet var tableView: UITableView!
    private var movies: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager().fetchMovies { (movies) in
            self.movies = movies
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        if let movie = movies?[indexPath.row] {
            cell.configure(with: movie)
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movie = movies?[indexPath.row] {
            onClickMovie(movie: movie)
        }
    }
    
    func onClickMovie(movie: Movie) {
        let vc = storyboard?.instantiateViewController(identifier: "detailMovie") as! DetailMovieViewController
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapAction(with movie: Movie) {
        onClickMovie(movie: movie)
    }
    
}

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
    let data = ["First", "Second", "Third", "Fourth", "Fifth"]
    let imageUrl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.movieImage.sd_setImage(with: URL(string: imageUrl), completed: nil)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onClickMovie(title: data[indexPath.row])
    }
    
    func onClickMovie(title: String) {
        let vc = storyboard?.instantiateViewController(identifier: "detailMovie") as! DetailMovieViewController
        vc.movieTitle = title
        vc.movieImageUrl = imageUrl
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapAction(with title: String) {
        onClickMovie(title: title)
    }
    
}

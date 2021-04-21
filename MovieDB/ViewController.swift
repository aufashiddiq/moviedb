//
//  ViewController.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 08/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieTableViewCellDelegate {

    @IBOutlet var tableView: UITableView!
    let data = ["First", "Second", "Third", "Fourth", "Fifth"]
    
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
        cell.delegate = self
        return cell
    }
    
    func onClickMovie(title: String) {
        let vc = storyboard?.instantiateViewController(identifier: "detailMovie") as! DetailMovieViewController
        vc.movieTitle = title
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapAction(with title: String) {
        onClickMovie(title: title)
    }
    
}

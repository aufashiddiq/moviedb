//
//  DetailMovieViewController.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 21/04/21.
//

import UIKit

class DetailMovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var movie: Movie?
    @IBOutlet var detailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.register(MovieSummaryTableViewCell.nib(), forCellReuseIdentifier: MovieSummaryTableViewCell.identifier)
        detailTableView.register(ActorTableViewCell.nib(), forCellReuseIdentifier: ActorTableViewCell.identifier)
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.separatorStyle = .none
        title = "Movie Detail"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieSummaryTableViewCell.identifier, for: indexPath) as! MovieSummaryTableViewCell
            cell.movie = movie
            cell.initView()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ActorTableViewCell.identifier, for: indexPath) as! ActorTableViewCell
            if let movie = self.movie {
                cell.configure(with: movie)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 1) {
            return 250.0
        }
        return tableView.estimatedRowHeight
    }
}

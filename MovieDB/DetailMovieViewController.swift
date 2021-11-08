//
//  DetailMovieViewController.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 21/04/21.
//

import UIKit

class DetailMovieViewController: UIViewController {

    var movie: Movie?
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var actorCollection: UICollectionView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieReleaseDate: UILabel!
    @IBOutlet var movieOverview: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

}

extension DetailMovieViewController {
    
    func initView() {
        title = "Movie Details"
        movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w300/\(movie?.posterPath ?? "")"), completed: nil)
        movieTitle.text = movie?.title ?? "-"
        movieReleaseDate.text = "Released Date: \(movie?.releaseDate ?? "-")"
        movieOverview.text = movie?.overview ?? "-"
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        actorCollection.collectionViewLayout = layout
        
        actorCollection.register(ActorCollectionViewCell.nib(), forCellWithReuseIdentifier: ActorCollectionViewCell.identifier)
        actorCollection.dataSource = self
        actorCollection.delegate = self
    }
}

extension DetailMovieViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

extension DetailMovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCollectionViewCell.identifier, for: indexPath) as! ActorCollectionViewCell
        cell.configure(with: "https://image.tmdb.org/t/p/w300/\(movie?.posterPath ?? "")")
        return cell
    }
    
}

extension DetailMovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}

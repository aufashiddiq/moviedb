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
    @IBOutlet var actorCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = movieTitle + " Movie"
        movieImage.sd_setImage(with: URL(string: movieImageUrl), completed: nil)
        view.backgroundColor = .white
        
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
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCollectionViewCell.identifier, for: indexPath) as! ActorCollectionViewCell
        cell.configure(with: movieImageUrl)
        return cell
    }
    
}

extension DetailMovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}

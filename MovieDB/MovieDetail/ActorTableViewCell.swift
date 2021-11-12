//
//  ActorTableViewCell.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 12/11/21.
//

import UIKit

class ActorTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    static let identifier = "ActorTableViewCell"
    var movie: Movie?
    var actors: [Cast]?
    @IBOutlet var collectionView: UICollectionView!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(ActorCollectionViewCell.nib(), forCellWithReuseIdentifier: ActorCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    public func configure(with movie: Movie) {
        self.movie = movie
        NetworkManager().fetchMovieCredit(withID: movie.id ?? 0) { (actors) in
            self.actors = actors.cast
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCollectionViewCell.identifier, for: indexPath) as! ActorCollectionViewCell
        if let cast = actors?[indexPath.row] {
            cell.configure(with: cast)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 135.0, height: 207.0)
    }
    
}

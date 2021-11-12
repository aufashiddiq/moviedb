//
//  ActorCollectionViewCell.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 21/04/21.
//

import UIKit

class ActorCollectionViewCell: UICollectionViewCell {

    static let identifier = "ActorCollectionViewCell"
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var actorName: UILabel!
    @IBOutlet var characterName: UILabel!
    private var imageUrl: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with cast: Cast) {
        self.imageUrl = "https://image.tmdb.org/t/p/w300/\(cast.profilePath ?? "")"
        imageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        self.actorName.text = cast.name
        self.characterName.text = cast.character
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

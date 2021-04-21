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
    private var imageUrl: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with imageUrl: String) {
        self.imageUrl = imageUrl
        imageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 20/04/21.
//

import UIKit

protocol MovieTableViewCellDelegate: AnyObject {
    func didTapAction(with title: String)
}

class MovieTableViewCell: UITableViewCell {
    
    weak var delegate: MovieTableViewCellDelegate?
    static let identifier = "MovieTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBAction func didTapAction() {
        delegate?.didTapAction(with: title)
    }

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieName: UIButton!
    
    private var title: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with title: String) {
        self.title = title
        movieName.setTitle(title, for: .normal)
    }

}

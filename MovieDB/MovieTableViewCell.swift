//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 20/04/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

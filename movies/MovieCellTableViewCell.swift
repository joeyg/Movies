//
//  MovieCellTableViewCell.swift
//  movies
//
//  Created by Joe Gasiorek on 4/14/15.
//  Copyright (c) 2015 Joe Gasiorek. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {
//    var titleLabel: UILabel
//    var synopsisLabel: UILabel
//    var posterLabel: UIImageView
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

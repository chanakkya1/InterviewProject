//
//  RocketCellTableViewCell.swift
//  SampleProject
//
//  Created by chanakkya mati on 9/1/17.
//  Copyright © 2017 chanakya. All rights reserved.
//

import UIKit

class RocketCellTableViewCell: UITableViewCell {

    
    @IBOutlet var flightNumberLabel: UILabel!
    @IBOutlet var launchDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

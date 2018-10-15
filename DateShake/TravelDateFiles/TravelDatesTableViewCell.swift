//
//  TravelDatesTableViewCell.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/28/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import UIKit

class TravelDatesTableViewCell: UITableViewCell {

    @IBOutlet weak var travelItemNameLabel: UILabel!
    @IBOutlet weak var travelItemImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

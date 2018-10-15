//
//  EatsDateTableViewCell.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/21/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit
class EatsDateTableViewCell: UITableViewCell {
    @IBOutlet weak var eatsItemNameLabel: UILabel!
    @IBOutlet weak var eatsItemImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  FunDatesTableViewCell.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/21/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit
class FunDatesTableViewCell: UITableViewCell {
    @IBOutlet weak var menuItemNameLabel: UILabel!
    @IBOutlet weak var menuItemImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

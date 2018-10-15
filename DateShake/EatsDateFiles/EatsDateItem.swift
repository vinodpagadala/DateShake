//
//  EatsDateItem.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/21/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit

class EatsDateItem: NSObject {
    
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

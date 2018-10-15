//
//  EatsDateManager.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/21/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit

class EatsDateManager: NSObject {
    
    static let sharedManager1 = EatsDateManager()
    
    private override init() {}
    
    // MARK: - Public Methods
    func loadData() -> [EatsDateItem] {
        let path = Bundle.main.path(forResource: "EatsDatesList", ofType: "plist")
        if let dataArray = NSArray(contentsOfFile: path!) {
            return constructMenuItemsFromArray(array: dataArray)
        } else {
            return [EatsDateItem]()
        }
    }
    
    // MARK: - Private Methods
    private func constructMenuItemsFromArray(array: NSArray) -> [EatsDateItem] {
        var resultItems = [EatsDateItem]()
        
        for object in array {
            let obj = object as! NSDictionary
            let name = obj["name"] as! String
            let image = obj["image"] as! String
            
            let loadedMenuItem = EatsDateItem(name: name, image: image)
            resultItems.append(loadedMenuItem)
        }
        return resultItems
    }
}


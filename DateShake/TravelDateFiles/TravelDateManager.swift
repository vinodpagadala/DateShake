//
//  TravelDateManager.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/28/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit

class TravelDateManager: NSObject {
    
    static let sharedManager2 = TravelDateManager()
    
    private override init() {}
    
    // MARK: - Public Methods
    func loadData() -> [TravelDateItem] {
        let path = Bundle.main.path(forResource: "TravelDatesList", ofType: "plist")
        if let dataArray = NSArray(contentsOfFile: path!) {
            return constructMenuItemsFromArray(array: dataArray)
        } else {
            return [TravelDateItem]()
        }
    }
    
    // MARK: - Private Methods
    private func constructMenuItemsFromArray(array: NSArray) -> [TravelDateItem] {
        var resultItems = [TravelDateItem]()
        
        for object in array {
            let obj = object as! NSDictionary
            let name = obj["name"] as! String
            let image = obj["image"] as! String
            
            let loadedMenuItem = TravelDateItem(name: name, image: image)
            resultItems.append(loadedMenuItem)
        }
        return resultItems
    }
}


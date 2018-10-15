//
//  FunDatesManager.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/14/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import Foundation
import UIKit

class FunDatesManager: NSObject {
    
    static let sharedManager = FunDatesManager()
    
    private override init() {}
    
    // MARK: - Public Methods
    func loadData() -> [FunDateItem] {
        let path = Bundle.main.path(forResource: "FunDatesList", ofType: "plist")
        if let dataArray = NSArray(contentsOfFile: path!) {
            return constructMenuItemsFromArray(array: dataArray)
        } else {
            return [FunDateItem]()
        }
    }
    
    // MARK: - Private Methods
    private func constructMenuItemsFromArray(array: NSArray) -> [FunDateItem] {
        var resultItems = [FunDateItem]()
        
        for object in array {
            let obj = object as! NSDictionary
            let name = obj["name"] as! String
            let image = obj["image"] as! String
            
            let loadedMenuItem = FunDateItem(name: name, image: image)
            resultItems.append(loadedMenuItem)
        }
        return resultItems
    }
}

//
//  TravelDatesTableViewController.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/28/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import UIKit
import NotificationCenter

class TravelDatesTableViewController: UIViewController {
    var travelDateItems: [TravelDateItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        travelDateItems = TravelDateManager.sharedManager2.loadData()
    }

}

extension TravelDatesTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return travelDateItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelDatesCell", for: indexPath) as! TravelDatesTableViewCell
        
        // Configure the cell...
        //cell.textLabel?.text = ""
        let item = travelDateItems[indexPath.row]
        
        cell.travelItemNameLabel?.text = item.name
        cell.travelItemImageView?.image = UIImage(named: item.image)
        
        return cell
}
}

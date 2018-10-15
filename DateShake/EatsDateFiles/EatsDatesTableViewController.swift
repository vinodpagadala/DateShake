//
//  EatsDatesTableViewController.swift
//  Shake It
//
//  Created by Manoj Muthireddy on 4/21/18.
//  Copyright © 2018 Manoj Muthireddy. All rights reserved.
//

import UIKit
import NotificationCenter


class EatsDatesTableViewController: UIViewController {//UIViewController
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint?
    
    var eatsDateItems: [EatsDateItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eatsDateItems = EatsDateManager.sharedManager1.loadData()
        
    }
    
}
extension EatsDatesTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eatsDateItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EatsDatesCell", for: indexPath) as! EatsDateTableViewCell
        
        // Configure the cell...
        //cell.textLabel?.text = ""
        let item = eatsDateItems[indexPath.row]
        
        cell.eatsItemNameLabel?.text = item.name
        cell.eatsItemImageView?.image = UIImage(named: item.image)
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}



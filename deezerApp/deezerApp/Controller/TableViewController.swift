//
//  TableViewController.swift
//  deezerApp
//
//  Created by Micael Dos Santos on 15/12/2020.
//

import UIKit

class TableViewController: UITableViewController {
    var listOfArtist = [Data]()
    // var apiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        //        Data.getArtist(name: "wejdene") { (results:[Data]) in
        //            for result in results{
        //                print("RESULT TABLE :")
        //                print("\(result)\n\n")
        //            }
        //
        //        }
        ApiService.getArtist(name: "wejdene") { (results:[Data]) in
            self.listOfArtist = results
            print(self.listOfArtist)
//            for result in results{
//                print("RESULT TABLE :")
//                print("\(result)\n\n")
//            }
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//                self.navigationItem.title = "\(self.listOfArtist.count) found"
//            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfArtist.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let artist = listOfArtist[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = artist.name
        cell.detailTextLabel?.text = artist.picture
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

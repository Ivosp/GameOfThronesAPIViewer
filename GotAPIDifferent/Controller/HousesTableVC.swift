//
//  HousesTableVC.swift
//  GotAPIDifferent
//
//  Created by Ivo Specht on 25/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import UIKit


// houseNameLabel: UILabel!
// regionLabel: UILabel!
// houseWordsLabel: UILabel!
// houseImage: UIImageView!

struct House {
    var name: String
    var region: String
    var words: String
    var image: UIImage?
}


class HousesTableVC: UITableViewController {
    
    let houseOne = House(name: "Stark", region: "The North", words: "Winter is coming", image: UIImage(named: "StarkSigil"))
    let houseTwo = House(name: "Lannister", region: "The Westerlands" , words: "Hear me Roar!", image: nil)
    var housesArray = [House]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorColor = .systemGray

        housesArray.append(houseOne)
        housesArray.append(houseTwo)
        tableView.register(UINib(nibName: Constants.TableViewIdentifiers.HouseCellRI, bundle: nil), forCellReuseIdentifier: Constants.TableViewIdentifiers.HouseCellRI)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return housesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewIdentifiers.HouseCellRI, for: indexPath) as! HousesCell

        cell.houseNameLabel.text = "House \(housesArray[indexPath.row].name)"
        cell.houseWordsLabel.text = housesArray[indexPath.row].words
        cell.regionLabel.text = housesArray[indexPath.row].region
        
        if housesArray[indexPath.row].image != nil {
            cell.houseImage.isHidden = false
            cell.houseImage.image = housesArray[indexPath.row].image
        } else {
            cell.houseImage.isHidden = true
            
        }

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

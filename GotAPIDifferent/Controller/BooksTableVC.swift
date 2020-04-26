//
//  BooksTableVC.swift
//  GotAPIDifferent
//
//  Created by Ivo Specht on 25/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import UIKit

class BooksTableVC: UITableViewController {
    
    var booksFound = [BookModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getBookData()
        
        tableView.register(UINib(nibName: Constants.TableViewIdentifiers.BookCellRI, bundle: nil), forCellReuseIdentifier: Constants.TableViewIdentifiers.BookCellRI)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getBookData()
    }
    
    func getBookData() {
        let bookRequest = BookRequest.init()
        bookRequest.fetchBookData { [weak self] result in
            
            switch result {
            case .failure(let error):
                print(error)
                return
            case .success(let books):
                self?.booksFound = books
            }
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return booksFound.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewIdentifiers.BookCellRI, for: indexPath) as! BooksCell
        
        cell.bookNameLabel.text = booksFound[indexPath.row].name
        cell.ISBNLabel.text = "ISB-N: \(booksFound[indexPath.row].isbn)"
        let formattedDate = booksFound[indexPath.row].released.replacingOccurrences(of: "T00:00:00", with: "")
        cell.releaseDateLabel.text = formattedDate
        cell.pageNumberLabel.text = "\(booksFound[indexPath.row].numberOfPages) pages."
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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

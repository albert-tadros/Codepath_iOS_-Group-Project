//
//  HomeTableViewController.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/22/22.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    // @IBOutlet weak var monthViewLabel: UILabel!
    

    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenRect = UIScreen.main.bounds
        let screenHeight = screenRect.size.height
        self.tableView.rowHeight = screenHeight/14

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func didTapHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return months.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monthCell", for: indexPath) as! MonthCellTableViewCell
        
        // Configure the cell...
        //print("I am in the Home Table View Cell")
        cell.monthViewLabel.text = months[indexPath.row]
        //NotesTableViewController.Month = cell.monthViewLabel.text!
        
        //just for API
        NotesTableViewController.cellIndex = indexPath.row
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        return cell
    }
    //monthToNotes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        //print("Loading up the details")
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let notesViewController = segue.destination as! NotesTableViewController
        notesViewController.Month = months[indexPath.row]
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //print("Loading up the details")
//
//        // Find the selected movies    (through the sender)
//        let cell = sender as! UITableViewCell   // the sender is the selected tableview cell
//        let indexPath = tableView.indexPath(for: cell)! // getting the indexpath of the selected cell
//        let movie = movies[indexPath.row] // getting data of selected movie through its indexpath
//
//        // pass the selected movie details to the details screen (through the segue)
//
//        let notesViewController = segue.destination as! NotesTableViewController // object to the class MovieDetailsViewController to access its properties
//        notesViewController.movieDetails = movie // PASS data from here to movieDetails property of the navigated screen (MovieDetailsViewController)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }

}

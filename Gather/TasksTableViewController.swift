//
//  DetailsTableViewController.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/23/22.
//

import UIKit
import NaturalLanguage


class TasksTableViewController: UITableViewController {
    
    //var passedNotesArr : [String] = NewNoteViewController.notesArr
    static var cellIndex : Int = 0
    static var TitleArr : [String] = []
    static var NotesArr : [String] = []
    var Month: String = ""
    
    static var LangForNoteTitleLabel: String = ""
    static var LangForNoteContentLabel: String = ""
    
//    static var noteDic : [String: Any] = [:]
//    static var notesDic : [String: Any] = [:]
//    static var monthsDic: [String :Any] = [:]
//    static var mainDic : [String: Any] = [:]
    
    
    //let allMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("passedNotesArr", NotesTableViewController.NotesArr)
        NewTaskViewController.month = Month
        print("month is", Month)
        //initializeMainDictionary()
        self.tableView.reloadData()

    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        //self.loadView()
        print("inside viewDidApear")
        //print("passedNotesArr", NotesTableViewController.NotesArr)
        //initializeMainDictionary()
        //print(" iside viewDid Appear Main Dic is: \n", NotesTableViewController.mainDic)
        self.tableView.reloadData()
        
    }
    
//    // to send the month name from which it was navigated to the new note page
//    @IBAction func onAddNewNote(_ sender: Any) {
//        performSegue(withIdentifier: "NotesTableToNewNote", sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let newNoteViewController = segue.destination as! NewNoteViewController
//        newNoteViewController.month = NotesTableViewController.Month
//    }
    
    // initiazlize the dictionary:
    
//    func initializeMainDictionary(){
//        for month in allMonths {
//            //noteDic  = ["title": Any.self, "noteContent": Any.self]
//            //notesDic = ["notes": noteDic]
//            //monthsDic = ["months": notesDic]
//            //mainDic = ["months":monthsDic]
//            NotesTableViewController.noteDic.updateValue(Int(), forKey: "time")
//            NotesTableViewController.noteDic.updateValue(String(), forKey: "noteContent")
//            NotesTableViewController.noteDic.updateValue(String(), forKey: "title")
//            NotesTableViewController.notesDic.updateValue(NotesTableViewController.noteDic, forKey: "notes")
//            NotesTableViewController.monthsDic.updateValue(NotesTableViewController.notesDic, forKey: month)
//            NotesTableViewController.mainDic.updateValue(NotesTableViewController.monthsDic, forKey: "months")
//
//        }
//        print("Main Dic is: \n", NotesTableViewController.mainDic)
//
//    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TasksTableViewController.NotesArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCellTableViewCell
        
//        let main = NotesTableViewController.mainDic
//        let months = main["months"] as! [String: String]
//        let notes = NotesTableViewController.monthsDic[Month] as! [String: Any]
//        let note = notes["notes"] as! [String: String]
//        cell.noteTitleLabel.text = note["title"]
//        cell.noteContentLabel.text = note["noteContent"]
        
        
        cell.noteTitleLabel.text = TasksTableViewController.TitleArr[indexPath.row]

        // adjusting the label alignment based on the user input language
        if TasksTableViewController.LangForNoteTitleLabel == "Arabic"{
            cell.noteTitleLabel.textAlignment = NSTextAlignment.right
        }else {
            cell.noteTitleLabel.textAlignment = NSTextAlignment.natural
        }
        
        
        cell.noteContentLabel.text = TasksTableViewController.NotesArr[indexPath.row]
        
        // adjusting the label alignment based on the user input language
        if TasksTableViewController.LangForNoteContentLabel == "Arabic"{
            cell.noteContentLabel.textAlignment = NSTextAlignment.right
        }else {
            cell.noteTitleLabel.textAlignment = NSTextAlignment.natural
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//
//  NewNoteViewController.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/23/22.
//

import UIKit
import NaturalLanguage

class NewTaskViewController: UIViewController {
    
    var noteTitleArr : [String] = []
    var notesArr : [String] = []
    
    //note
    static var month : String = ""
    var id : Int = 0
    
    
    
    @IBOutlet weak var noteTitleField: UITextField!
    @IBOutlet weak var noteContentView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTitleField.becomeFirstResponder()
        noteContentView.becomeFirstResponder()
        print("inisde new note view and month is", NewTaskViewController.month)
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNewNote(_ sender: Any) {
        id += id
        let noteTitle = noteTitleField.text!
        let noteContent = noteContentView.text!
        
        TasksTableViewController.LangForNoteTitleLabel = detectedLanguage(for: noteTitle)!
        TasksTableViewController.LangForNoteContentLabel = detectedLanguage(for: noteContent)!
        
//        let mainDic = NotesTableViewController.mainDic
//        let monthsDic = mainDic["months"] as! [String: Any]
        //let note = ["title": noteTitle, "noteContent": noteContent, "time": id] as [String : Any]
//        let notes = ["notes": ["noteContent": noteContent, "title": noteTitle, "time": id]]
//        NotesTableViewController.monthsDic.updateValue(notes, forKey: NewNoteViewController.month)
        //var noteDic = NotesTableViewController.notesDic
//        noteDic.updateValue(noteTitle, forKey: "title")
//        noteDic.updateValue(noteContent, forKey: "noteContent")
//        noteDic.updateValue(id, forKey: "time")
//        noteDic["title"] = noteTitle
//        noteDic["noteContent"] = noteContent
        //noteDic["time"] = id
        
        //print("noteDic["title"]", noteDic["title"]) // a good test case for input sanitization
        //print("noteDic[title]", notesDic["notes"]!)
        //print(" inside new note Main Dic is: \n", NotesTableViewController.mainDic)
        
        TasksTableViewController.TitleArr.append(noteTitle)
        TasksTableViewController.NotesArr.append(noteContent)
        
//        print("I am before performSegue")
//        performSegue(withIdentifier: "AddToNoteCell", sender: self)
//        print("I passed perform segue")
        dismiss(animated: true)
        //print("noteArr", notesArr)
    }
    
    @IBAction func deleteNote(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func detectedLanguage(for string: String) -> String? {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(string)
        guard let languageCode = recognizer.dominantLanguage?.rawValue else { return nil }
        let detectedLanguage = Locale.current.localizedString(forIdentifier: languageCode)
        print("detected Langauge is", detectedLanguage!)
        return detectedLanguage
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        // pass the selected movie details to the details screen (through the segue)
//        let notesViewController = segue.destination as! NotesTableViewController // object to the class MovieDetailsViewController to access its properties
//        notesViewController.passedNotesArr = self.notesArr
//    }

}

//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit


class DisplayNoteViewController: UIViewController {
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let listNotesTableViewController = segue.destination as! ListNotesTableViewController
    if segue.identifier == "Save" {
        if let note = note {
            // 1
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            // 2
            listNotesTableViewController.tableView.reloadData()
        } else {
            // 3
            let newNote = Note()
            newNote.title = noteTitleTextField.text ?? ""
            newNote.content = noteContentTextView.text ?? ""
            newNote.modificationTime = Date()
            listNotesTableViewController.notes.append(newNote)
        }
    }
}    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // 1
    if let note = note {
        // 2
        noteTitleTextField.text = note.title
        noteContentTextView.text = note.content
    } else {
        // 3
        noteTitleTextField.text = ""
        noteContentTextView.text = ""
    }
}
    
    
    
}

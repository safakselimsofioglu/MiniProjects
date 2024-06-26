//
//  NewNoteVC.swift
//  NoteApp
//
//  Created by Şafak Selim Sofioğlu on 26.06.2024.
//

import UIKit

class NewNoteVC: UIViewController {

    
    @IBOutlet weak var headerTF: UITextField!
    @IBOutlet weak var context: UITextView!
    
    var note:Notlar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context.text = "Enter text"
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let header = headerTF.text, let context = context.text {
            NotlarDao().addNotes(header: header, context: context)
        }
    }
    
    
    

}

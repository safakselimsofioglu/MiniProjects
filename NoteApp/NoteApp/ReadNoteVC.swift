//
//  ReadNoteVC.swift
//  NoteApp
//
//  Created by Şafak Selim Sofioğlu on 26.06.2024.
//

import UIKit

class ReadNoteVC: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var contextTextView: UITextView!
    var note: Notlar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let note = note {
            headerLabel.text = note.name!
            contextTextView.text = note.context!
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  NoteApp
//
//  Created by Şafak Selim Sofioğlu on 26.06.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var notlarTableView: UITableView!
    var noteList = [Notlar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        copyDatabase()
        notlarTableView.dataSource = self
        notlarTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        noteList = NotlarDao().getAllNotes()
        notlarTableView.reloadData()
    }
    
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "notlarDB", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let copyLocation = URL(fileURLWithPath: targetPath).appendingPathComponent("notlarDB.sqlite")
        if fileManager.fileExists(atPath: copyLocation.path) {
            print("The database already exists. No need to copy it.")
        }else{
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyLocation.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = noteList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteTableViewCell
        cell.headerLabel.text = note.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){contextualAction,view, bool in
            let note = self.noteList[indexPath.row]
            let alert = UIAlertController(title: "Deletion Process", message: "Do you want delete \(note.name!)", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.noteList = NotlarDao().deleteNote(note_id: note.id!)
                self.notlarTableView.reloadData()
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toReadNote", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        if segue.identifier == "toReadNote" {
            let toVC = segue.destination as! ReadNoteVC
            toVC.note = noteList[indeks!]
            
        }
    }
    
    


}


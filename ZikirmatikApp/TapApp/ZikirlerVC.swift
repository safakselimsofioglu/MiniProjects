//
//  ViewController.swift
//  TapApp
//
//  Created by Şafak Selim Sofioğlu on 23.06.2024.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ZikirlerVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let context = appDelegate.persistentContainer.viewContext

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var zikirlerTableView: UITableView!
    var zikirlerList = [Zikirler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        zikirlerTableView.delegate = self
        zikirlerTableView.dataSource = self
        
        zikirLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        zikirLoad()
        zikirlerTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zikirlerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let zikir = zikirlerList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "zikirCell") as! ZikirCell
        cell.nameLabel.text = zikir.name!
        cell.countLabel.text = String(zikir.count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ contextualAction,view,bool in
            let zikir = self.zikirlerList[indexPath.row]
            let alert = UIAlertController(title: "Deletion Process", message: "\(zikir.name!)", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.context.delete(zikir)
                appDelegate.saveContext()
                self.zikirLoad()
                self.zikirlerTableView.reloadData()
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let zikir = zikirlerList[indexPath.row]
        performSegue(withIdentifier: "toZikir", sender: zikir)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toZikir" {
            if let zikir = sender as? Zikirler {
                let toVC = segue.destination as! ZikirVC
                toVC.zikir = zikir
            }
        }
    }
    
    func zikirLoad(){
        do{
            let liste = try context.fetch(Zikirler.fetchRequest())
            zikirlerList = liste
        } catch{
            print(error.localizedDescription)
        }
    }


}


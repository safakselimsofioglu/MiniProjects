//
//  ZikirAddVC.swift
//  TapApp
//
//  Created by Şafak Selim Sofioğlu on 23.06.2024.
//

import UIKit
import CoreData

class ZikirAddVC: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext

    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let name = nameTextField.text, let count = Int(countTextField.text!) {
            let zikir = Zikirler(context: context)
            
            zikir.name = name
            zikir.count = Int32(count)
            zikir.setValue(UUID(), forKey: "id")
            appDelegate.saveContext()
        }
    }
    
}

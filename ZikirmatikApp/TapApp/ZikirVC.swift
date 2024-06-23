//
//  ZikirVC.swift
//  TapApp
//
//  Created by Şafak Selim Sofioğlu on 23.06.2024.
//

import UIKit

class ZikirVC: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    var zikir = Zikirler()
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        nameLabel.text = zikir.name!
        countLabel.text = String(zikir.count)
        count = Int(zikir.count)

        
    }
    
    @IBAction func increaseButton(_ sender: Any) {
        count += 1
        countLabel.text = String(count)
        zikir.count = Int32(count)
        appDelegate.saveContext()
    }
    

}

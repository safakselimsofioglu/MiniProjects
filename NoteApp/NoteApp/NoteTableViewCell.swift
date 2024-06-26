//
//  NoteTableViewCell.swift
//  NoteApp
//
//  Created by Şafak Selim Sofioğlu on 26.06.2024.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

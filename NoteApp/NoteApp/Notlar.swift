//
//  Notlar.swift
//  NoteApp
//
//  Created by Şafak Selim Sofioğlu on 26.06.2024.
//

import Foundation

class Notlar {
    var id:Int?
    var name:String?
    var context:String?
    
    init() {
        
    }
    
    init(id: Int, name: String, context: String) {
        self.id = id
        self.name = name
        self.context = context
    }
}

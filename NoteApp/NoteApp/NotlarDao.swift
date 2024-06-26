//
//  NotlarDao.swift
//  NoteApp
//
//  Created by Şafak Selim Sofioğlu on 26.06.2024.
//

import Foundation

class NotlarDao {
    let db:FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyLocation = URL(fileURLWithPath: targetPath).appendingPathComponent("notlarDB.sqlite")
        db = FMDatabase(path: copyLocation.path)
    }
    
    func getAllNotes() -> [Notlar] {
        var list = [Notlar]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM Notlar", values: nil)
            while rs.next() {
                let not = Notlar(
                    id: Int(rs.string(forColumn: "id"))!,
                    name: rs.string(forColumn: "name")!,
                    context: rs.string(forColumn: "context")
                )
                list.append(not)
            }
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        return list
    }
    
    func addNotes(header:String, context:String){
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO Notlar (name,context) VALUES (?,?)", values: [header,context])
            print("Note add successfully")
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func deleteAllNotes(){
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM Notlar", values: nil)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func deleteNote(note_id:Int) -> [Notlar]{
        var list = [Notlar]()
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM Notlar WHERE id = ?", values: [note_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        list = getAllNotes()
        return list
    }
}

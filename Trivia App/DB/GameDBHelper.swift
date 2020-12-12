//
//  GameDBHelper.swift
//  Trivia App
//
//  Created by Danish on 11/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import Foundation

import SQLite3

class GameDBHelper
{
    init()
    {
        db = openDatabase()
        
        createTable()  // create table in DB
    }
    
    let dbPath: String = "myDb.sqlite"
    
    var db:OpaquePointer?
    
    
    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            
            return db
        }
    }
    
    
    func createTable() {
        
        // Creating Table Name "gametable" with 5 coloumns
        
        let createTableString = "CREATE TABLE IF NOT EXISTS gametable(Id INTEGER PRIMARY KEY,date TEXT,name TEXT,answer1 TEXT,answer2 TEXT);"
        
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("game table created.")
            }
            else {
                print("game table could not be created.")
            }
        }
        else {
            
            print("CREATE TABLE statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insert(id: Int, date: String, name: String, answer1: String, answer2: String)
    {
        let game = read()
        
        for g in game
        {
            if g.id == id
            {
                return
            }
        }
        let insertStatementString = "INSERT INTO gametable (Id, date, name, answer1, answer2) VALUES (?, ?, ?, ?, ?);"
       
        var insertStatement: OpaquePointer? = nil
        
        // data insterting in each coloumn
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            
            sqlite3_bind_text(insertStatement, 2, (date as NSString).utf8String, -1, nil)
            
            sqlite3_bind_text(insertStatement, 3, (name as NSString).utf8String, -1, nil)
            
            sqlite3_bind_text(insertStatement, 4, (answer1 as NSString).utf8String, -1, nil)
        
            sqlite3_bind_text(insertStatement, 5, (answer2 as NSString).utf8String, -1, nil)
            
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
               
                print("Successfully inserted row.")
            }
            else {
                
                print("Could not insert row.")
            }
        }
        else {
            
            print("INSERT statement could not be prepared.")
        }
        
        sqlite3_finalize(insertStatement)
    }
    
    
    func read() -> [Game] {
        
        let queryStatementString = "SELECT * FROM gametable;"
        
        var queryStatement: OpaquePointer? = nil
        
        var game : [Game] = []
        
        // Read each row with while loop
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                let id = sqlite3_column_int(queryStatement, 0)
                
                let date = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                
                
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
       
                let answer1 = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
        
                let answer2 = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                
               
                game.append(Game(id: Int(id) , date: date, name: name, answer1: answer1, answer2: answer2))
                
                print("Query Result:")
                
                print("-------------\(id)-------------")
            }
        }
        else {
          
            print("SELECT statement could not be prepared")
        }
        
        sqlite3_finalize(queryStatement)
        
        return game
    }
    
    
    func deleteByID(id:Int) {
        
        let deleteStatementStirng = "DELETE FROM gametable WHERE Id = ?;"
     
        var deleteStatement: OpaquePointer? = nil
       
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                
                print("Successfully deleted row.")
            }
            else {
                print("Could not delete row.")
            }
        }
        else {
            
            print("DELETE statement could not be prepared")
        }
        
        sqlite3_finalize(deleteStatement)
    }
    
}

//
//  File.swift
//  Trivia App
//
//  Created by Danish on 11/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import Foundation

class Game{
    
    var id: Int = 0
    
    var date: String = ""
    
    var name: String = ""
    
    var answer1: String = ""
    
    var answer2: String = ""
  
    
    init(id: Int, date: String, name: String, answer1: String, answer2: String ){
        
        self.id = id
        
        self.date = date
        
        self.name = name
    
        self.answer1 = answer1
        
        self.answer2 = answer2
    }
    
}

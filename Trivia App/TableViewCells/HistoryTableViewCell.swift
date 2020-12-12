//
//  HistoryTableViewCell.swift
//  Trivia App
//
//  Created by Danish on 12/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var answer2Lbl: UILabel!
    
    @IBOutlet weak var answer1Lbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var dateTimeLbl: UILabel!
    
    
    //MARK: - VARIABLES
    
    static let identifier = "historyTableCell"

    
    // MARK: - METHODS
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func layout(record: Game, counter: Int){
        
        nameLbl.text = "Name : \(record.name)"
        
        dateTimeLbl.text = "GAME \(counter) : \(record.date)"
        
        answer1Lbl.text = "Answer : \(record.answer1)"
        
        answer2Lbl.text = "Answers : \(record.answer2)"
    }
    
}

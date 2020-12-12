//
//  ForthPageViewController.swift
//  Trivia App
//
//  Created by Danish on 11/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import UIKit

class ForthPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- VARIABLES

    var db:GameDBHelper = GameDBHelper()
    
    var game:[Game] = []
    
    var name: String = ""
    
    var question1Choice: String = ""
    
    var question2Choice =  [String]()
    
    var answer2: String = ""
    
    var list = [Game]()


    //MARK:- OUTLETS
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var answer2Lbl: UILabel!
    
    @IBOutlet weak var answer1Lbl: UILabel!
    
    @IBOutlet weak var helloNameLbl: UILabel!
    
    
    //MARK:- ACTIONS
    
    @IBAction func finish(_ sender: Any) {
        
        let dateTime = getDateTime()
        
        let data = db.read()
        
        let id = data.count + 1
        
        db.insert(id: id, date: dateTime, name: name, answer1: question1Choice, answer2: answer2)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func history(_ sender: Any) {

        list = db.read()
        
        if list.count == 0{
            
            showToast(message: StringConstants.noHistory)
        }
        else{
        
            tblView.reloadData()
        }
    }
        
    
    // MARK: - VIEW METHODS
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        addBackButton()
        
        setBarTheme()
        
        setTexts()
        
        tblView.delegate = self
        
        tblView.dataSource = self
    }
    
    
    //MARK: - OTHER METHODS
    
    func setTexts(){
        
        self.navigationItem.title = StringConstants.forthPage

        self.helloNameLbl.text = "Hello \(name)."
        
        self.answer1Lbl.text = question1Choice
        
       
        for choice in question2Choice{
            
            answer2 = "\(answer2)\(choice), "
        }
        
        var indexRemoveAt = (answer2.count - 1)
        
        answer2.remove(at: String.Index(encodedOffset: indexRemoveAt))
        
        indexRemoveAt = answer2.count - 1
        
        answer2.remove(at: String.Index(encodedOffset: indexRemoveAt))

        self.answer2Lbl.text = answer2
        
    }
    
    func getDateTime() -> String {
        
        let date : Date = Date()
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = StringConstants.dateFormat
        
        let todaysDate = dateFormatter.string(from: date)
        
        return "\(todaysDate)"
        
    }
    
    
    
    // MARK:- TABLEVIEWS
    
    // number of rows in table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    
    // create a cell for each table view row
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HistoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier) as! HistoryTableViewCell
        
        cell.layout(record: list[indexPath.row], counter: (indexPath.row + 1) )
        
        return cell
    }
 
}

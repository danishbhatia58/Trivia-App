//
//  ThirdPageViewController.swift
//  Trivia App
//
//  Created by Danish on 10/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import UIKit

class ThirdPageViewController: UIViewController {

    //MARK: OUTLETS
    
    @IBOutlet weak var opt4: UIButton!
    
    @IBOutlet weak var opt3: UIButton!
    
    @IBOutlet weak var opt2: UIButton!
    
    @IBOutlet weak var opt1: UIButton!
    
    
    //MARK:- VARIABLES
    
    var name: String = ""
    
    var question1Choice: String = ""
    
    
    // MARK:- VIEW METhODS
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = StringConstants.thirdPage
        
        setBarTheme()
        
        addBackButton()
        
        setActions()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK:- ACTIONS
    
    @IBAction func nextButton(_ sender: Any) {
        
        let viewController = Storyboard.getForthPageViewController()
        
        var stop = true
        
        var question2Choice = [String]()
        
        if let vc = viewController as? ForthPageViewController{
            
            vc.name = name
            
            vc.question1Choice = question1Choice
            
            if opt1.isSelected{
                
                question2Choice.append( StringConstants.question2OptionA )
                
                stop = false
            }
            if opt2.isSelected{
                
                question2Choice.append( StringConstants.question2OptionB)
                
                stop = false
            }
            if opt3.isSelected{
                
                question2Choice.append( StringConstants.question2OptionC)
                
                stop = false
            }
            if opt4.isSelected{
                
                question2Choice.append( StringConstants.question2OptionD)
                
                stop = false
            }
            if stop {
                
                showToast(message: StringConstants.selectOneOrMore)
            }
            
            if !stop{
                
                vc.question2Choice = question2Choice
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }
    
    
    func setActions(){
        
        opt1.addTarget(self, action: #selector( optionOne ( sender: ) ), for: .touchUpInside)
        
        opt2.addTarget(self, action: #selector( optionTwo ( sender: ) ), for: .touchUpInside)
        
        opt3.addTarget(self, action: #selector( optionThree ( sender: ) ), for: .touchUpInside)
        
        opt4.addTarget(self, action: #selector( optionFour ( sender: ) ), for: .touchUpInside)
        
    }
    
    
    
    @objc func optionOne(sender: UIButton){
        
        if sender.isSelected == true{
            
            setNilBackgroundImage(sender: opt1)
            
            setSelectedState(sender: opt1, state: false)
        }
        else{
            
            setBackgroundImage(sender: opt1)
            
            setSelectedState(sender: opt1, state: true)
            
        }
        
    }
    
    @objc func optionTwo(sender: UIButton){
        
        if sender.isSelected == true{
            
            setNilBackgroundImage(sender: opt2)
            
            setSelectedState(sender: opt2, state: false)
        }
        else{
            
            setBackgroundImage(sender: opt2)
            
            setSelectedState(sender: opt2, state: true)
            
        }
        
    }
    
    @objc func optionThree(sender: UIButton){
        
        if sender.isSelected == true{
            
            setNilBackgroundImage(sender: opt3)
            
            setSelectedState(sender: opt3, state: false)
        }
        else{
            
            setBackgroundImage(sender: opt3)
            
            setSelectedState(sender: opt3, state: true)
            
            
        }
        
    }
    @objc func optionFour(sender: UIButton){
        
        if sender.isSelected == true{
            
            setNilBackgroundImage(sender: opt4)
            
            setSelectedState(sender: opt4, state: false)
        }
        else{
            
            setBackgroundImage(sender: opt4)
            
            setSelectedState(sender: opt4, state: true)
           
        }
    }
    
    
    // MARK:- OTHER METHODS
    
    func setNilBackgroundImage(sender: UIButton){
        
        sender.setBackgroundImage(nil, for: .normal)
    }
    
    
    func setBackgroundImage(sender: UIButton){
        
        sender.setBackgroundImage(UIImage(named: ImageConstants.checkbox), for: .normal)
        
        sender.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setSelectedState(sender: UIButton, state: Bool){
        
        sender.isSelected = state
    }
    
}

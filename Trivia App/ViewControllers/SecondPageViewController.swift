//
//  SecondPageViewController.swift
//  Trivia App
//
//  Created by Danish on 09/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import UIKit

class SecondPageViewController: UIViewController {

    //MARK: - OUTLETS
    
    @IBOutlet weak var opt1: UIButton!
    
    @IBOutlet weak var opt2: UIButton!
    
    @IBOutlet weak var opt3: UIButton!
    
    @IBOutlet weak var opt4: UIButton!
    
    
    //MARK: - VARIABLES
    
    var name: String = ""
    
    
    // MARK: VIEW METHODS
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = StringConstants.secondPage
        
        addBackButton()
        
        setBarTheme()
            
        setActions()
    }
    
    // MARK: ACTIONS
    
    @IBAction func nextButton(_ sender: Any) {
        
        let viewController = Storyboard.getThirdPageViewController()
        
        var stop = false
        
        if let vc = viewController as? ThirdPageViewController{
            
            vc.name = name
            
            if opt1.isSelected{
                
                vc.question1Choice = StringConstants.question1OptionA
            }
            else if opt2.isSelected{
                
                vc.question1Choice = StringConstants.question1OptionB
            }
            else if opt3.isSelected{
                
                vc.question1Choice = StringConstants.question1OptionC
            }
            else if opt4.isSelected{
                
                vc.question1Choice = StringConstants.question1OptionD
            }
            else{
                
                stop = true
                
                showToast(message: StringConstants.selectOne)
            }
            
            if !stop{
                
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
            
            setNilBackgroundImage(sender: opt2)
            
            setNilBackgroundImage(sender: opt3)
            
            setNilBackgroundImage(sender: opt4)
            
            
            setSelectedState(sender: opt1, state: true)
            
            setSelectedState(sender: opt2, state: false)
            
            setSelectedState(sender: opt3, state: false)
            
            setSelectedState(sender: opt4, state: false)
        }
        
    }
    
    @objc func optionTwo(sender: UIButton){
        
        if sender.isSelected == true{
            
            setNilBackgroundImage(sender: opt2)
            
            setSelectedState(sender: opt2, state: false)
        }
        else{
            
            setBackgroundImage(sender: opt2)
            
            setNilBackgroundImage(sender: opt1)
            
            setNilBackgroundImage(sender: opt3)
            
            setNilBackgroundImage(sender: opt4)
            
            
            setSelectedState(sender: opt2, state: true)
            
            setSelectedState(sender: opt1, state: false)
            
            setSelectedState(sender: opt3, state: false)
            
            setSelectedState(sender: opt4, state: false)
        }
        
    }
    
    @objc func optionThree(sender: UIButton){
        
        if sender.isSelected == true{
            
            setNilBackgroundImage(sender: opt3)
            
            setSelectedState(sender: opt3, state: false)
        }
        else{
            
            setBackgroundImage(sender: opt3)
            
            setNilBackgroundImage(sender: opt1)
            
            setNilBackgroundImage(sender: opt2)
            
            setNilBackgroundImage(sender: opt4)
            
            
            setSelectedState(sender: opt3, state: true)
            
            setSelectedState(sender: opt1, state: false)
            
            setSelectedState(sender: opt2, state: false)
            
            setSelectedState(sender: opt4, state: false)
        }
        
    }
    @objc func optionFour(sender: UIButton){
        
        if sender.isSelected == true{
            
            setNilBackgroundImage(sender: opt4)
            
            setSelectedState(sender: opt4, state: false)
        }
        else{
            
            setBackgroundImage(sender: opt4)
            
            setNilBackgroundImage(sender: opt1)
            
            setNilBackgroundImage(sender: opt2)
            
            setNilBackgroundImage(sender: opt3)
            
            
            setSelectedState(sender: opt4, state: true)
            
            setSelectedState(sender: opt1, state: false)
            
            setSelectedState(sender: opt2, state: false)
            
            setSelectedState(sender: opt3, state: false)
        }
    }
    
    
    //MARK: OTHER METHODS
    
    func setNilBackgroundImage(sender: UIButton){
        
        sender.setBackgroundImage(nil, for: .normal)
    }
    
    func setBackgroundImage(sender: UIButton){
        
        sender.setBackgroundImage(UIImage(named: ImageConstants.checkbox ), for: .normal)
    }
    
    func setSelectedState(sender: UIButton, state: Bool){
        
        sender.isSelected = state
    }
    
}

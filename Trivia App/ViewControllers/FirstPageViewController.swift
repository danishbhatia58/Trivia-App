//
//  ViewController.swift
//  Trivia App
//
//  Created by Danish on 09/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    //MARK: - OUTLETS
    
    @IBOutlet weak var nameTextFeild: UITextField!
    
    
    //MARK: - VIEW METHODS
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = StringConstants.firstPage
        
        setBarTheme()
        
    }
    
    
    // MARK: - ACTIONS

    @IBAction func nextButton(_ sender: Any) {
        
        let viewController = Storyboard.getSecondPageViewController()
        
        if let vc = viewController as? SecondPageViewController{
            
            if nameTextFeild.text == ""{
                
                // popup
                
                showToast(message: StringConstants.enterName)
            }
            else{
            
                vc.name = nameTextFeild.text ?? ""
                
                nameTextFeild.text = ""
                
                // go to next page
                
                self.navigationController?.pushViewController(vc, animated: true)
        
            }
        }
        
    }
    
}


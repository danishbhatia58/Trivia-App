//
//  Extensions.swift
//  Trivia App
//
//  Created by Danish on 12/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import Foundation

import  UIKit


extension UIViewController{
    
    func addBackButton() {
        
        let backButton = UIBarButtonItem()
        
        backButton.title = ""
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton     
    }
    
    func setBarTheme(){
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 125, y: view.frame.size.height-100, width: 250, height: 50))
        
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        toastLabel.textColor = UIColor.white
        
        toastLabel.textAlignment = .center;
        
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        
        toastLabel.text = message
        
        toastLabel.alpha = 1.0
        
        toastLabel.layer.cornerRadius = 10;
        
        toastLabel.clipsToBounds  =  true
        
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 12.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
            
        }, completion: {(isCompleted) in
            
            toastLabel.removeFromSuperview()
        })
    }}

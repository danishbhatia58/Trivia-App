//
//  Storyboard.swift
//  Trivia App
//
//  Created by Danish on 09/12/20.
//  Copyright © 2020 Danish. All rights reserved.
//

import Foundation

import UIKit


struct Storyboard{
    
    struct Name{
        
        static let main = "Main"
    }
    
    struct identifiers{
        
        static let firstPageVC = "firstPageVC"
        
        static let secondPageVC = "secondPageVC"
        
        static let thirdPageVC = "thirdPageVC"
        
        static let forthPageVC = "forthPageVC"
    }
    
    
    static func getViewController(identifier: String, storyboard: String) -> UIViewController {
        
        let storyBoard = UIStoryboard(name: storyboard, bundle: nil)
        
        let viewController = storyBoard.instantiateViewController(withIdentifier: identifier)
        
        return viewController
    }
    
    
    static func getSecondPageViewController() -> UIViewController{
        
        return getViewController(identifier: Storyboard.identifiers.secondPageVC , storyboard: Storyboard.Name.main)
    }
    
    
    static func getThirdPageViewController() -> UIViewController{
        
        return getViewController(identifier: Storyboard.identifiers.thirdPageVC , storyboard: Storyboard.Name.main)
    }
    
    
    static func getForthPageViewController() -> UIViewController{
        
        return getViewController(identifier: Storyboard.identifiers.forthPageVC , storyboard: Storyboard.Name.main)
    }
    
}

//
//  InstantiationProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 3/02/21.
//

import UIKit

public protocol InstantiationProtocol where Self: UIViewController {
    
}

extension InstantiationProtocol {
    
    fileprivate static func bringStoryBoard() -> UIStoryboard? {
        
        let selfDescription = String(describing: Self.self)
        let vc = "ViewController"
        let resourceType = "storyboardc"
        let bundle = Bundle(for: Self.self)
        
        
        
        if let _ = bundle.path(forResource: selfDescription, ofType: resourceType) {
            return UIStoryboard(name: selfDescription, bundle: bundle)
        } else if selfDescription.contains(vc) {
            
            let range = selfDescription.range(of: vc)!
            let selfDescriptionCutted = String(selfDescription[..<range.lowerBound])
            
            if let _ = bundle.path(forResource: selfDescriptionCutted, ofType: resourceType) {
                
                let storyBoard = UIStoryboard(name: selfDescriptionCutted, bundle: bundle)
                return storyBoard
            }
        }
        
        return nil
    }
    
    /// Function to instantiate the ViewController from the storyBoard that must have the same Name but without 'ViewController'
    /// - Parameter storyboardId: StoryBoard id if it's not the first viewController
    public static func instantiate(storyboardId: String? = nil) -> Self? {
        guard let storyBoard = Self.bringStoryBoard() else {
            return nil
        }
        if let vc = storyBoard.instantiateInitialViewController() as? Self {
            return vc
        }
        return nil
    }
}

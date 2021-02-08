//
//  HeroViewController.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 3/02/21.
//

import UIKit

open class HeroViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
        configureNavigationBar()
    }
    
    fileprivate func configureNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemRed,
        ]
        
        navBarAppearance.largeTitleTextAttributes = textAttributes
        navBarAppearance.titleTextAttributes = textAttributes
        
        navBarAppearance.backgroundColor = UIColor.black
        navBarAppearance.shadowColor = .clear
        navBarAppearance.shadowImage = UIImage()
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.systemRed
        
        navigationController?.navigationBar.barTintColor = UIColor.red
    }
}

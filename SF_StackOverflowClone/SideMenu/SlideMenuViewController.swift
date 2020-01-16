//
//  SlideMenuViewController.swift
//  SF_StackOverflowClone
//
//  Created by Salma on 1/15/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController {
    
    // MARK: OUTLET
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    var menuOut = false
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        if menuOut == false {
            leadingConstraint.constant = 150
            trailingConstraint.constant = -150
            menuOut = true
            
        } else {
            leadingConstraint.constant = 0
            trailingConstraint.constant = 0
            menuOut = false
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

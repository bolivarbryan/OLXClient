//
//  ViewController.swift
//  OLXClient
//
//  Created by Bryan A Bolivar M on 3/14/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Constants
    private let kWelcomeText = "Welcome"
    
    //MARK: Variables
    
    //MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = kWelcomeText.localized()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Methods
}




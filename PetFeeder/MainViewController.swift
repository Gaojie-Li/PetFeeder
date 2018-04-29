//
//  MainViewController.swift
//  PetFeeder
//
//  Created by Gaojie Li on 3/26/18.
//  Copyright © 2018 Gaojie Li. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    
    @IBOutlet weak var trailingConstraints: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    var hamburgerMenuVisible = false
    
    @IBAction func hamburgerTapped(_ sender: Any) {
        if !hamburgerMenuVisible {
            leadingConstraints.constant = 150
            trailingConstraints.constant = 150
            
            hamburgerMenuVisible = true
        } else {
            leadingConstraints.constant = 0
            trailingConstraints.constant = 0
            
            hamburgerMenuVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//
//  ProfileViewController.swift
//  PetFeeder
//
//  Created by Gaojie Li on 5/1/18.
//  Copyright © 2018 Gaojie Li. All rights reserved.
//

import Foundation
import UIKit
import Parse

class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameLabel.text = PFUser.current()?.object(forKey: "username") as? String
        emailLabel.text = PFUser.current()?.object(forKey: "email") as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

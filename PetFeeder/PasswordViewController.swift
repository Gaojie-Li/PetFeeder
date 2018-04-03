//
//  PasswordViewController.swift
//  PetFeeder
//
//  Created by Jingting Zhang on 4/2/18.
//  Copyright © 2018 Gaojie Li. All rights reserved.
//

import Foundation
import UIKit
import Parse

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var noticeTextView: UITextView!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var sendEmailButton: UIButton!
    
    @IBAction func sendEmailPressed(_ sender: Any) {
        let emailaddress = emailText.text!
        
        PFUser.requestPasswordResetForEmail(inBackground: emailaddress)
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

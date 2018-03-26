//
//  RegisterViewController.swift
//  PetFeeder
//
//  Created by Gaojie Li on 3/25/18.
//  Copyright © 2018 Gaojie Li. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController : UIViewController {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var reenterPasswordText: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if (passwordText.text != reenterPasswordText.text) {
            let alert = UIAlertController(title: "", message: "The entered passwords are different! Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            
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

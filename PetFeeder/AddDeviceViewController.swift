//
//  AddDeviceViewController.swift
//  PetFeeder
//
//  Created by Gaojie Li on 5/1/18.
//  Copyright © 2018 Gaojie Li. All rights reserved.
//

import Foundation
import UIKit
import Parse

class AddDeviceViewController: UIViewController {
    
    @IBOutlet weak var ip_text: UITextField!
    @IBOutlet weak var port_text: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        PFUser.current()?.setObject(ip_text.text!, forKey: "ip")
        PFUser.current()?.setObject(Int32(Int(port_text.text!)!), forKey: "port")
        PFUser.current()?.saveInBackground()
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

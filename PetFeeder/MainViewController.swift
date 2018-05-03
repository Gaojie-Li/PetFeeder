//
//  MainViewController.swift
//  PetFeeder
//
//  Created by Gaojie Li on 3/26/18.
//  Copyright © 2018 Gaojie Li. All rights reserved.
//

import Foundation
import UIKit
import Parse

class MainViewController : UIViewController {
    
    @IBOutlet weak var trailingConstraints: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var connectedLabel: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var signoutButton: UIButton!
    @IBOutlet weak var hamburgerMenu: UIStackView!
    
    var hamburgerMenuVisible = false
    var client:TCPClient!
    var status = 0
    
    @IBAction func signoutButtonTapped(_ sender: UIButton) {
        PFUser.logOutInBackground()
        client.close()
    }
    
    @IBAction func hamburgerTapped(_ sender: Any) {
        if (!hamburgerMenuVisible) {
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
    
    @IBAction func connectButtonTapped(_ sender: UIButton) {
        let currentUser = PFUser.current()
        if (currentUser?.object(forKey: "ip") == nil || currentUser?.object(forKey: "port") == nil) {
            let alert = UIAlertController(title: "No device connected.", message: "Please add a device.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            print("IN")
            let ip = currentUser?.object(forKey: "ip") as! String
            let port = currentUser?.object(forKey: "port") as! Int32
            
            client = TCPClient(address: ip, port: port)
            
            switch client.connect(timeout: 40) {
            case .success:
                // Connection successful 🎉
                connectedLabel.isHidden = false
            case .failure(let error):
                print("error")
            }
            print("out")
        }
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if (status==0) {
            status=1
            switch client.send(string: "O" ) {
            case .success:
                statusLabel.isHidden = false
                statusLabel.text="Feeder status: ON"

            case .failure(let error):
                print(error)
            }
        } else {
            status=0
            switch client.send(string: "S" ) {
            case .success:
                statusLabel.isHidden = false
                statusLabel.text="Feeder status: OFF"

            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        connectedLabel.isHidden = true
        statusLabel.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

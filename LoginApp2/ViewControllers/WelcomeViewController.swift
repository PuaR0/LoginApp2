//
//  WelcomeViewController.swift
//  LoginApp2
//
//  Created by Алиага С on 19.6.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.fullName)"
        
    }
}

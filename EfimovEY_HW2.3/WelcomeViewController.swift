//
//  WelcomeViewController.swift
//  EfimovEY_HW2.3
//
//  Created by User on 13.07.2021.
//

import UIKit


class WelcomeViewController: UIViewController {
    
    var userWelcome: String?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = userWelcome else { return }
        welcomeLabel.text = "Welcome, \(user)"
        exitButton.layer.cornerRadius = 6
    }

}

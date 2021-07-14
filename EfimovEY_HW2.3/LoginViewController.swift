//
//  ViewController.swift
//  EfimovEY_HW2.3
//
//  Created by User on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameLoginTF: UITextField!
    @IBOutlet weak var passwordLoginTF: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    let login = "Eugenya"
    let password = "Bruyko"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vsd = segue.destination as? WelcomeViewController else { return }
        vsd.userWelcome = nameLoginTF.text
    }
    
    @IBAction func logIn() {
        if nameLoginTF.text == login &&
            passwordLoginTF.text == password {
            performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
        else {
            toCallAlertAttention()
        }
    }
    
    @IBAction func helpButton(_ sender: UIButton) {
        if sender.tag == 1 {
            toCallAlertHelp(data: login)
        }
        else {
            toCallAlertHelp(data: password)
        }
    }
    
    @IBAction func unwindGoToLoginVC (send: UIStoryboardSegue) {
        nameLoginTF.text = ""
        passwordLoginTF.text = ""
    }
    
   private func toCallAlertAttention() {
        let alert = UIAlertController(
            title: "Attention",
            message: "Incorrect username or password",
            preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(
                            title: "Ok",
                            style: .cancel,
                            handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func toCallAlertHelp(data: String) {
         let alert = UIAlertController(
             title: nil,
             message: "\(data)",
             preferredStyle: UIAlertController.Style.alert)
         alert.addAction(UIAlertAction(
                             title: "Ok",
                             style: .cancel,
                             handler: nil))
         present(alert, animated: true, completion: nil)
     }

}


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
    
    private let login = "Eugenya"
    private let password = "Bruyko"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 5
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
            let title = "Attention"
            let message = "Incorrect username or password"
            toCallAlertAttention(title: title, message: message)
            passwordLoginTF.text = ""
        }
    }
    
    @IBAction func helpButton(_ sender: UIButton) {
        sender.tag == 1 ? toCallAlertAttention(title: nil, message: login) :
            toCallAlertAttention(title: nil, message: password)
    }
    
    @IBAction func unwindGoToLoginVC (send: UIStoryboardSegue) {
        nameLoginTF.text = ""
        passwordLoginTF.text = ""
    }
    
    private func toCallAlertAttention( title: String?,  message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(
                            title: "Ok",
                            style: .cancel,
                            handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn (_ textFild: UITextField) -> Bool {
        if  textFild == nameLoginTF {
            passwordLoginTF.becomeFirstResponder()
        } else {
            logIn()
        }
        return true
    }
}


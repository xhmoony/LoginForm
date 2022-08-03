//
//  ViewController.swift
//  LoginForm
//
//  Created by Владимир Х. on 02.08.2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: -
    @IBOutlet var loginForm: UITextField!
    @IBOutlet var passwordForm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginForm.layer.cornerRadius = 25
        passwordForm.layer.cornerRadius = 25
    }

    // MARK: -
    private let trueLogin = "Teacher"
    private let truePassword = "q"
    
    // MARK: -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.trueLogin = trueLogin
            
    }
    // MARK: -
    @IBAction func loginButton() {
        if loginForm.text != trueLogin || passwordForm.text != truePassword {
            showAlert(tittle: "Error", message: "Try again", textField: loginForm)
        }
    }
    
    
    @IBAction func forgotLoginData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(tittle: "Well, it happens", message: "try \(trueLogin)")
        : showAlert(tittle: "Well, it happens", message: "try \(truePassword)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        loginForm.text = ""
        loginForm.text = ""
    }
}


// MARK: - Private Methods
extension LoginViewController {
    private func showAlert (tittle: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Oh:(", style: .default) { _ in textField?.text = "" }
        alert.addAction(ok)
        present(alert, animated: true)
        }
    }

// MARK: - Keyboard (
extension LoginViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginForm {
            passwordForm.becomeFirstResponder()
        } else {
            loginButton()
            performSegue(withIdentifier: "", sender: nil)
            
        }
        return true
    }
}

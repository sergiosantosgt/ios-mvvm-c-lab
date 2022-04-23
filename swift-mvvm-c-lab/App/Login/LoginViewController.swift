//
//  LoginViewController.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded, UITextFieldDelegate {
    
    
    @IBOutlet weak var email: LocalizedTextField!
    @IBOutlet weak var password: LocalizedTextField!
    @IBOutlet weak var loginButton: ButtonWithProgress!
    
    static var storyboard = AppStoryboard.login
    var viewModel: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDismissKeyboard()

        loginButton.isEnabled = false
        self.email.delegate = self
        self.password.delegate = self
    }
    
    @IBAction func loginAction(_ sender: Any) {
        login()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        viewModel?.doRegister()
        
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        validateLoginFields()
    }
    
    private func login() {
        updateLoginFormState(onLoginState: false)
        
        viewModel?.doLogin(email: self.email.text!, password: self.password.text!, completion: { (success) in
            if(!success) {
                let alert = Alert(title: Constants.authFailTitle, message: Constants.authFailMsg, action: Constants.cancelMsg)
                self.present(alert.getAlert(), animated: true, completion: nil)
            }
            
            self.updateLoginFormState(onLoginState: true)
            
        })
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        //textField code

        textField.resignFirstResponder()  //if desired
        performTextFieldAction()
        return true
    }

    private func performTextFieldAction() {
        Logger.info("Press Go")
        if loginButton.isEnabled {
            login()
        }
    }
    
    private func validateLoginFields() {
        let validator = Validator()
        if validator.validate(text: email.text!, with: [.notEmpty, .validEmail]) == nil
            && validator.validate(text: password.text!, with: [.notEmpty]) == nil {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
    
    private func updateLoginFormState(onLoginState: Bool) {
        if onLoginState {
            self.email.isEnabled = true
            self.password.isEnabled = true
            self.loginButton.isInProgress = false
        } else {
            self.email.isEnabled = false
            self.password.isEnabled = false
            self.loginButton.isInProgress = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

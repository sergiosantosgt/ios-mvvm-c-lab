//
//  LoginViewController.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    
    @IBOutlet weak var email: LocalizedTextField!
    @IBOutlet weak var password: LocalizedTextField!
    @IBOutlet weak var loginButton: ButtonWithProgress!
    
    static var storyboard = AppStoryboard.login
    var viewModel: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.isEnabled = false
    }
    
    @IBAction func loginAction(_ sender: Any) {
        viewModel?.doLogin(email: self.email.text!, password: self.password.text!, completion: { (success) in
            if(!success) {
                let alert = Alert(titulo: "Falha ao autenticar", mensagem: "Falha ao realizar a autenticação, por favor, tente novamente.")
                self.present(alert.getAlert(), animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        validateLoginFields()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

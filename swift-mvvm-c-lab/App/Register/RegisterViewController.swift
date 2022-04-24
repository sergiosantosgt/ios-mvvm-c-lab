//
//  RegisterViewController.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 23/04/22.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var email: LocalizedTextField!
    @IBOutlet weak var name: LocalizedTextField!
    @IBOutlet weak var surname: LocalizedTextField!
    @IBOutlet weak var password: LocalizedTextField!
    @IBOutlet weak var passwordConfirmation: LocalizedTextField!
    @IBOutlet weak var registerButton: ButtonWithProgress!
    
    static var storyboard = AppStoryboard.register
    var viewModel: RegisterViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.registerTitle

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.viewDidDisapear.accept?(())
    }
    
    @IBAction func register(_ sender: Any) {
        Logger.info("Register")
        let textFieldError = validateFields()
        
        updateLoginFormState(onExecutionState: true)
        
        if textFieldError == "" {
            Logger.info("Validation Success")
            viewModel?.doRegister(email: self.email.text!, password: self.password.text!, completion: {(success) in
                self.updateLoginFormState(onExecutionState: false)
                if(success) {
                    let alertData = Alert(title: Constants.registerTitle, message: Constants.registerSuccessMsg, actionTitle: Constants.cancelMsg)
                    let alert = alertData.getAlert(actionCancel: false)
                    let action = UIAlertAction(title: Constants.proceedMsg, style: .default, handler: {_ in
                        self.viewModel?.goToHome()
                    })
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    let alert = Alert(title: Constants.registerTitle, message: Constants.registerFailMsg, actionTitle: Constants.cancelMsg)
                    self.present(alert.getAlert(), animated: true, completion: nil)
                }
            })
        } else {
            Logger.error("Validation Error \(textFieldError)")
            let alert = Alert(title: Constants.registerTitle, message: "\(Constants.registerValidationFailMsg) \(textFieldError)", actionTitle: Constants.cancelMsg)
            self.present(alert.getAlert(), animated: true, completion: nil)
            updateLoginFormState(onExecutionState: false)
        }
    }
    
    
    @IBAction func textFieldChaged(_ sender: Any) {
    }
    
    private func validateFields() -> String {
        let validator = Validator()
        if validator.validate(text: email.text!, with: [.notEmpty, .validEmail]) != nil {
            return "\(Constants.checkField) E-mail."
        } else if validator.validate(text: name.text!, with: [.notEmpty]) != nil {
            return "\(Constants.checkField) Nome."
        } else if validator.validate(text: surname.text!, with: [.notEmpty]) != nil {
            return "\(Constants.checkField) Sobrenome."
        } else if validator.validate(text: password.text!, with: [.notEmpty]) != nil {
            return "\(Constants.checkField) Senha."
        } else if validator.validate(text: passwordConfirmation.text!, with: [.notEmpty]) != nil {
            return "\(Constants.checkField) Confirmação de senha."
        } else if !validator.checkConfirmation(password: password.text!, passwordConfirmation: passwordConfirmation.text!) {
            Logger.info("Senha confirmacao")
            return "As senhas digitadas não coincidem. Verifique e tente novamente, por favor."
        }
        return ""
    }
    
    private func updateLoginFormState(onExecutionState: Bool) {
        if onExecutionState {
            self.email.isEnabled = true
            self.name.isEnabled = true
            self.surname.isEnabled = true
            self.password.isEnabled = true
            self.passwordConfirmation.isEnabled = true
            self.registerButton.isInProgress = false
        } else {
            self.email.isEnabled = false
            self.name.isEnabled = false
            self.surname.isEnabled = false
            self.password.isEnabled = false
            self.passwordConfirmation.isEnabled = false
            self.registerButton.isInProgress = true
        }
    }
}

//
//  RegisterViewController.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 23/04/22.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.register
    var viewModel: RegisterViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Register"

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.viewDidDisapear.accept?(())
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

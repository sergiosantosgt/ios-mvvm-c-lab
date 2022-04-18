//
//  HomeViewController.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 12/04/22.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.home
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

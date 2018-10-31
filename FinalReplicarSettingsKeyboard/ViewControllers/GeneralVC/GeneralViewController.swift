//
//  GeneralViewController.swift
//  FinalReplicarSettingsKeyboard
//
//  Created by IGNACIO OLAGORTA VERA on 24/10/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showPrincipalVC(){
        let principal = PrincipalViewController()
        let navigationController = UINavigationController(rootViewController: principal)
        navigationController.modalTransitionStyle = .coverVertical
        present(navigationController, animated: true, completion: nil)
    }
}

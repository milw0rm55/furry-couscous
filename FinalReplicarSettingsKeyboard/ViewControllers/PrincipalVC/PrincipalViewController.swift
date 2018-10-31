//
//  PrincipalViewController.swift
//  FinalReplicarSettingsKeyboard
//
//  Created by IGNACIO OLAGORTA VERA on 24/10/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {
    
    internal var section1: [FirstSection] = []
    internal var section2: [FirstSection] = []
    internal var section3: [SecondSection] = []
    internal var section4: [SecondSection] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCells()
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCells() {
        let withSwitchTableViewCellNib = UINib(nibName: "WithSwitchTableViewCell", bundle: nil)
        tableView.register(withSwitchTableViewCellNib, forCellReuseIdentifier: "withSwitchTableViewCell")
        let KeyboardsViewControllerNib = UINib(nibName: "KeyboardsViewController", bundle: nil)
        tableView.register(KeyboardsViewControllerNib, forCellReuseIdentifier: "KeyboardsViewController")
    }
    
    func loadCells() {
        let s1c1 = FirstSection(name: "Keyboards", number: "3")
        let s1c2 = FirstSection(name: "Hardware Keyboards", number: "")
        section1.append(s1c1)
        section1.append(s1c2)
        let s2c1 = FirstSection(name: "Text Replacement", number: "")
        let s2c2 = FirstSection(name: "One Handed Keyboard", number: "Off")
        section2.append(s2c1)
        section2.append(s2c2)
        let s3c1 = SecondSection(name: "Auto-Capitalization")
        let s3c2 = SecondSection(name: "Auto-Correction")
        let s3c3 = SecondSection(name: "Check Spelling")
        let s3c4 = SecondSection(name: "Eneable Caps Lock")
        let s3c5 = SecondSection(name: "Predictive")
        let s3c6 = SecondSection(name: "Smart Punctuation")
        let s3c7 = SecondSection(name: "Character Preview")
        let s3c8 = SecondSection(name: "'.' Shortcut")
        section3.append(s3c1)
        section3.append(s3c2)
        section3.append(s3c3)
        section3.append(s3c4)
        section3.append(s3c5)
        section3.append(s3c6)
        section3.append(s3c7)
        section3.append(s3c8)
        let s4c1 = SecondSection(name: "Eneable Dictation")
        section4.append(s4c1)
    }
    
}

extension PrincipalViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titleForSection: String = ""
        switch section {
        case 2:
            titleForSection = "all keyboards"
        case 3:
            titleForSection = "dictation"
        default:
            titleForSection = ""
        }
        return titleForSection
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section==2 {
            return "Double tapping the space bar will insert a period followed by a space"
        }else{
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsInSection = 0
        switch section{
        case 0:
            rowsInSection = section1.count
        case 1:
            rowsInSection = section2.count
        case 2:
            rowsInSection = section3.count
        case 3:
            rowsInSection = section4.count
        default:
            rowsInSection = 0
        }
        return rowsInSection
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print(section1[indexPath.row].name!)
        case 1:
            print(section2[indexPath.row].name!)
        case 2:
            print(section3[indexPath.row].name!)
        case 3:
            print(section4[indexPath.row].name!)
        default:
            print("Esto no deberia de pasar")
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let KeyboardTableView:KeyboardsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "KeyboardCell", for: indexPath) as? KeyboardsTableViewCell)!
        
        let SwitchTableView:SwitchTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchTableViewCell)!
        
        switch indexPath.section {
        case 0:
            KeyboardTableView.lblNombre.text = section1[indexPath.row].name
            KeyboardTableView.lblNumber.text = section1[indexPath.row].number
            return KeyboardTableView
        case 1:
            KeyboardTableView.lblNombre.text = section2[indexPath.row].name
            KeyboardTableView.lblNumber.text = section2[indexPath.row].number
            return KeyboardTableView
        case 2:
            SwitchTableView.lblName.text = section3[indexPath.row].name
            return SwitchTableView
        case 3:
            SwitchTableView.lblName.text = section4[indexPath.row].name
            return SwitchTableView
        default:
            SwitchTableView.lblName.text = "Error"
            return SwitchTableView
        }
        
        
    }
}


//
//  AppointmentSearch.swift
//  Linkd
//
//  Created by Khawar on 10/9/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class AppointmentSearch: UIViewController {
    
    
    @IBOutlet weak var SearchView: UIView!
    
    // outlet for MenuBarApear
    @IBOutlet weak var MenuBarApear3: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // Navigation Controller
    self.title = "Appointments"
        
    // For Giving Border to UIView
    SearchView.layer.borderColor = UIColor.lightGray.cgColor
    SearchView.layer.borderWidth = 1
        
    // for MenuBArApear
    MenuBarApear3.target = revealViewController()
    MenuBarApear3.action = #selector(SWRevealViewController.revealToggle(_:))
    
    }

    override func didReceiveMemoryWarning() {
    
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
   
}

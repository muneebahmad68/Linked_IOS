//
//  EventSearch.swift
//  Linkd
//
//  Created by Khawar on 10/10/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class EventSearch: UIViewController {

    @IBOutlet weak var SearchView: UIView!
    
    // outlet for MenuBarApear
    @IBOutlet weak var MenuBarApear4: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // Navigation Controller
    self.title = "Events"

    SearchView.layer.borderColor = UIColor.lightGray.cgColor
    SearchView.layer.borderWidth = 1
        
    // for MenuBArApear
    MenuBarApear4.target = revealViewController()
    MenuBarApear4.action = #selector(SWRevealViewController.revealToggle(_:))
        
    }

    override func didReceiveMemoryWarning() {
    
        super.didReceiveMemoryWarning()
    
    }
    
}

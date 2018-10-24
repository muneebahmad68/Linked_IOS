//
//  ViewController.swift
//  SideMenuViewController
//
//  Created by Khawar on 10/11/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var barMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var barMenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        barMenuButton.target = revealViewController()
        barMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        self.revealViewController().rearViewRevealWidth = 240
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


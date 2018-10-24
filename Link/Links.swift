//
//  Links.swift
//  Linkd
//
//  Created by Khawar on 10/8/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class Links: UIViewController {

    @IBOutlet weak var LinkView: UIView!
    
    // outlet for menuBarButton
    @IBOutlet weak var MenuBarApear1: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // Navigation Controller
    self.title = "Links"
        
    // change navigation title color e.g check current color is white
    //  navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    // For Border Color of UIView
    LinkView.layer.borderColor = UIColor.lightGray.cgColor
    LinkView.layer.borderWidth = 0.5
        
    // for MenuBarButton Apear1
    MenuBarApear1.target = revealViewController()
    MenuBarApear1.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//
//  Requests.swift
//  Linkd
//
//  Created by Khawar on 10/8/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class Requests: UIViewController {

    @IBOutlet weak var RequestView: UIView!
    
    // outlet for MenuBarApear
    @IBOutlet weak var MenubarApear2: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // For Giving Border to UIView
    RequestView.layer.borderColor = UIColor.lightGray.cgColor
    RequestView.layer.borderWidth = 0.5
        
    // for MenuBArApear
    MenubarApear2.target = revealViewController()
    MenubarApear2.action = #selector(SWRevealViewController.revealToggle(_:))
      
    // Title Of Navigation Bar
    self.title = "Requests"
        
    // change navigation background color
    //   navigationController?.navigationBar.barTintColor = UIColor.blue
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
                                }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}

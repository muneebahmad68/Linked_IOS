//
//  MyCard.swift
//  Linkd
//
//  Created by Khawar on 10/8/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class MyCard: UIViewController {

    
    @IBOutlet weak var MenuBarApear: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // for MenuBArApear
    MenuBarApear.target = revealViewController()
    MenuBarApear.action = #selector(SWRevealViewController.revealToggle(_:))
        
    // Title Of Navigation Bar
    self.title = "My Card"
        
    // change navigation background color
    //  navigationController?.navigationBar.barTintColor = UIColor.blue
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func EditBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditCard") as! EditCard
    //  UIApplication.shared.keyWindow?.rootViewController = viewController
        navigationController?.pushViewController(vc, animated: true)
    }

}

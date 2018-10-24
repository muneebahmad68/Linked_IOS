//
//  ForgetPassword.swift
//  Linkd
//
//  Created by Khawar on 10/15/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class ForgetPassword: UIViewController {

    // Outlets Of Forget Password View Controller
    @IBOutlet weak var ForgetPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // Title Of Navigation Bar
    self.title = "Forget Password"
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    // For Border Color
    ForgetPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
    ForgetPasswordTextField.layer.borderWidth = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

}

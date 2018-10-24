//
//  Account.swift
//  Linkd
//
//  Created by Khawar on 10/10/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class Account: UIViewController, UITextFieldDelegate {
    
    // Outlets for Hiding Keyboard
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastName1textField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var MobileNumberTextField: UITextField!
    @IBOutlet weak var AltMobileNumberTextField: UITextField!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var NewPasswordTextField: UITextField!
    //
    
    // Outlet For MenuBarApear
    @IBOutlet weak var MenuBarApear5: UIBarButtonItem!
    
    // outlets for CountryCode
    @IBOutlet weak var CountryCodeTextField2: UITextField!
    @IBOutlet weak var CountryCodeTextField3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // Title of Navigation Bar
    self.title = "Account"
        
    // for MenuBArApear
    MenuBarApear5.target = revealViewController()
    MenuBarApear5.action = #selector(SWRevealViewController.revealToggle(_:))
        
    }
    
    override func didReceiveMemoryWarning() {
      
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    // Function for Country Code
    
    @IBAction func CountryCode2(_ sender: Any) {
       
        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
    //  countryView.displayLanguage = .chinese
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
    //  self.countryNameLabel.text = "\(countryDic["en"] as! String)"
    //  self.countryImageView.image = countryDic["countryImage"] as? UIImage
        self.CountryCodeTextField2.text = "+\(countryDic["code"] as! NSNumber)"
       
        }
    }

    @IBAction func CountryCode3(_ sender: Any) {
       
        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
    //  countryView.displayLanguage = .chinese
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
    //  self.countryNameLabel.text = "\(countryDic["en"] as! String)"
    //  self.countryImageView.image = countryDic["countryImage"] as? UIImage
        self.CountryCodeTextField3.text = "+\(countryDic["code"] as! NSNumber)"
       
        }
    }

}

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
    
    @IBOutlet weak var UserNameLbl: UILabel!
    @IBOutlet weak var businessTypeLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var phoneCodeLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var gmailLbl: UILabel!
    @IBOutlet weak var skypeIDLbl: UILabel!
    
    // Variables for getting values from Contact Detail and Work Details
    let userNameValue = UserDefaults.standard.object(forKey: "username")
    let countryCodeValue = UserDefaults.standard.object(forKey: "CountryCode")
    let PhoneNumberValue = UserDefaults.standard.object(forKey: "phone")
    let skypeIDValue = UserDefaults.standard.object(forKey: "skype_id")
    
    let workEmailValue = UserDefaults.standard.string(forKey: "work_email")
    let companyNameValue = UserDefaults.standard.string(forKey: "company_name")
    let businesstypeValue = UserDefaults.standard.object(forKey: "business_type")
    let addressValue = UserDefaults.standard.object(forKey: "address")
    
    //
    let myCardUpdatedGmail = UserDefaults.standard.object(forKey: "work_email")
    let myCardUpdatedCompanyName = UserDefaults.standard.object(forKey: "company_name")
    let myCardUpdatedBusinessType = UserDefaults.standard.object(forKey: "business_type")
    let myCardUpdatedAddress = UserDefaults.standard.object(forKey: "address")
    
    
    
    //

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // for MenuBArApear
    MenuBarApear.target = revealViewController()
    MenuBarApear.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
        self.UserNameLbl.text! = userNameValue as! String
        self.phoneCodeLbl.text! = countryCodeValue as! String
        self.phoneNumberLbl.text! = PhoneNumberValue as! String
        self.skypeIDLbl.text! = skypeIDValue as! String
        
        self.gmailLbl.text! = workEmailValue as! String
        self.companyNameLbl.text! = companyNameValue as! String
        self.businessTypeLbl.text! = businesstypeValue as! String
        self.addressLbl.text! = addressValue as! String
        
    // Title Of Navigation Bar
    self.title = "My Card"
    
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
                self.gmailLbl.text! = myCardUpdatedGmail as! String
                self.companyNameLbl.text! = myCardUpdatedCompanyName as! String
                self.businessTypeLbl.text! = myCardUpdatedBusinessType as! String
                self.addressLbl.text! = myCardUpdatedAddress as! String
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func EditBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditCard") as! EditCard
        vc.editCardEmail = self.gmailLbl.text!
        vc.editCardCompnayName = self.companyNameLbl.text!
        vc.editCardBusinesstype = self.businessTypeLbl.text!
        vc.editCardAddress = self.addressLbl.text!
    //  UIApplication.shared.keyWindow?.rootViewController = viewController
        navigationController?.pushViewController(vc, animated: true)
    }

}

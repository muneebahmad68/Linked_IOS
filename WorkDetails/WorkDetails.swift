//
//  WorkDetails.swift
//  Linkd
//
//  Created by Khawar on 10/8/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class WorkDetails: UIViewController, UITextFieldDelegate {

    let activityIndicatorVariable = UIApplication.shared.delegate as! AppDelegate
  
    
    // Outlets for Work Details
    @IBOutlet weak var WorkEmail1TextField: UITextField!
    @IBOutlet weak var CompanyName1textField: UITextField!
    @IBOutlet weak var WorkTitle1TextField: UITextField!
    @IBOutlet weak var AddressLine1TextField: UITextField!
    @IBOutlet weak var AddressLine2TextField: UITextField!
    @IBOutlet weak var city1TextField: UITextField!
    @IBOutlet weak var Country1TextField: UITextField!
    //
    
        var workEmailValue = ""
        var companyNameValue = ""
        var workTitleValue = ""
        var workAddressLine = ""
        var workAddress2Value = ""
        var cityNameValue = ""
        var countryNameValue = ""
    
    
    // Outlet for CountryList
    @IBOutlet weak var CountryTextField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // Title Of Navigation Bar
    self.title = "Work Details"
        
        // show email value in next controller
        print(workEmailValue)
        //
        
        WorkEmail1TextField?.text = workEmailValue
        CompanyName1textField?.text = companyNameValue
        WorkTitle1TextField?.text = workTitleValue
        AddressLine1TextField?.text = workAddressLine
        AddressLine2TextField?.text = workAddress2Value
        city1TextField.text = cityNameValue
        Country1TextField.text = countryNameValue
        
        // Setting Values for Work Details
        UserDefaults.standard.set(self.WorkEmail1TextField.text, forKey: "work_email")
        UserDefaults.standard.set(self.CompanyName1textField.text, forKey: "company_name")
        UserDefaults.standard.set(self.WorkTitle1TextField.text, forKey: "business_type")
        UserDefaults.standard.set(self.AddressLine1TextField.text, forKey: "address")
        UserDefaults.standard.set(self.AddressLine2TextField .text, forKey: "workdetailsscndaddress")
        UserDefaults.standard.set(self.city1TextField.text, forKey: "WorkDetailsCity")
        UserDefaults.standard.set(self.Country1TextField.text, forKey: "WorkDetailsCountry")
        
        
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
      
    } //View Did Load

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func CountryList1(_ sender: UIButton) {
        
        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
        self.CountryTextField1.text = "\(countryDic["en"] as! String)"
        }
    }
    
    @IBAction func CompleteButtonTapped(_ sender: Any) {
        
//        activityIndicatorVariable.ActivityIndicator(uiView: self.view)
//        self.activityIndicatorVariable.ActivityIndicator(uiView: self.view)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//        vc.businessTypeValue = self.WorkTitle1TextField.text!
        UIApplication.shared.keyWindow?.rootViewController = vc
        //  navigationController?.pushViewController(vc, animated: true)
    }
    
}

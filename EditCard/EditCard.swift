//
//  EditCard.swift
//  Linkd
//
//  Created by Khawar on 10/8/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class EditCard: UIViewController, UITextFieldDelegate {

    let activityIndicatorVariable = UIApplication.shared.delegate as! AppDelegate
    
    // Outlets for Work Detail
    @IBOutlet weak var WorkEmail1TextField: UITextField!
    @IBOutlet weak var CompanyName1TextField: UITextField!
    @IBOutlet weak var WorkTitle1TextField: UITextField!
    @IBOutlet weak var frstAddressEditCardTextField: UITextField!
    @IBOutlet weak var scndAddressEditCardTextField: UITextField!
    @IBOutlet weak var CityEditCardTextField: UITextField!
    @IBOutlet weak var CountryEditCardTextField: UITextField!
    //
    
    var editCardEmail = ""
    var editCardCompnayName = ""
    var editCardBusinesstype = ""
    var editCardAddress = ""
   
    
    // create PickerView
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    // array declaration for pickerView
    var pickWorkTitle:[String] = []
    var cities:[String] = []
    
    
    // Outlet for Country List
    @IBOutlet weak var CountryTextField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        WorkEmail1TextField?.text = editCardEmail
        CompanyName1TextField?.text = editCardCompnayName
        WorkTitle1TextField?.text = editCardBusinesstype
        frstAddressEditCardTextField?.text = editCardAddress
        
        pickWorkTitle = ["Lead Strategic Partner", "Lead Strategic Partner2", "Lead Strategic Partner3", "Lead Strategic Partner4"]
        cities = ["Lahore", "Islamabad", "Karachi", "Faisalabad", "Peshawar"]
        
        
    // Title Of Navigation Bar
    self.title = "Edit Card"
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    } // ViewDidLoad
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function for Country List 
    @IBAction func CountryList2(_ sender: UIButton) {
        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
        self.CountryTextField2.text = "\(countryDic["en"] as! String)"
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTextField = textField
        if currentTextField == WorkTitle1TextField {
            currentTextField.inputView = pickerView
        } else if currentTextField == CityEditCardTextField {
            currentTextField.inputView = pickerView
        }
    }
    
    
    @IBAction func SaveBtnTapped(_ sender: Any) {
  
        activityIndicatorVariable.ActivityIndicator(uiView: self.view)
        
        // Save Edit Card Detail
        UserDefaults.standard.set(self.WorkEmail1TextField.text!, forKey: "work_email")
          UserDefaults.standard.set(self.CompanyName1TextField.text!, forKey: "company_name")
        UserDefaults.standard.set(self.WorkTitle1TextField.text!, forKey: "business_type")
        UserDefaults.standard.set(self.frstAddressEditCardTextField.text!, forKey: "address")
       
        var dic = Dictionary<String,AnyObject>()
        dic["work_id"] = WorkEmail1TextField.text as AnyObject
        dic["email"] = CompanyName1TextField .text as AnyObject
        dic["company"] = WorkTitle1TextField .text as AnyObject
        dic["title"] = frstAddressEditCardTextField.text as AnyObject
        dic["address"] = scndAddressEditCardTextField.text as AnyObject
        dic["city"] = CityEditCardTextField.text as AnyObject
        dic["country"] = CountryEditCardTextField.text as AnyObject
        
        
//        Utility.shared.showSpinner()
        ALFWebService.shared.doPostData(parameters: dic, method: "editCart", success: { (response) in
            self.activityIndicatorVariable.ActivityIndicator(uiView: self.view)
            print(response)
            
//            Utility.shared.hideSpinner()
            if let status = response["status"] as? String {
                if status == "true" {
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
                    UIApplication.shared.keyWindow?.rootViewController = viewController
                } else {
                    print ("Your Informatioin is not correct")
                }
            }
        }) { (response) in
            print(response)
//            Utility.shared.hideSpinner()
        }
        //

    }

}

extension EditCard : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if currentTextField == WorkTitle1TextField {
            return pickWorkTitle.count
        } else if currentTextField == CityEditCardTextField {
            return cities.count
        } else  {
            return 0
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if currentTextField == WorkTitle1TextField {
            WorkTitle1TextField.text = pickWorkTitle[row]
            self.view.endEditing(true)
        } else if currentTextField == CityEditCardTextField {
            CityEditCardTextField.text = cities[row]
            self.view.endEditing(true)
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if currentTextField == WorkTitle1TextField {
            return pickWorkTitle[row]
        } else if currentTextField == CityEditCardTextField {
            return cities[row]
        } else  {
            return ""
        }
    }
}






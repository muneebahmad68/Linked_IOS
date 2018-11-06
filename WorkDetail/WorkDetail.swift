
//  WorkDetail.swift
//  Linkd
//
//  Created by Khawar on 10/4/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class WorkDetail: UIViewController, UITextFieldDelegate {

    
    let activityIndicatorVariable = UIApplication.shared.delegate as! AppDelegate
    
    // Outlets for Work Detail
    @IBOutlet weak var WorkEmailTextField: UITextField!
    @IBOutlet weak var CompanyNametextField: UITextField!
    @IBOutlet weak var WorkTitleTextField: UITextField!
    @IBOutlet weak var FirstAddressLineTextFld: UITextField!
    @IBOutlet weak var AddressLineTextField: UITextField!
    @IBOutlet weak var CityTextField: UITextField!
    //
    
    // create PickerView
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    // array declaration for pickerView
    var pickWorkTitle:[String] = []
    var cities:[String] = []
   

    // variable for location/address picker
    var txt_data = ""

    //Outlet for CountryList
    @IBOutlet weak var CountryTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickWorkTitle = ["Lead Strategic Partner", "Lead Strategic Partner2", "Lead Strategic Partner3", "Lead Strategic Partner4"]
        cities = ["Lahore", "Islamabad", "Karachi", "Faisalabad", "Peshawar"]

        // for location/address picker
        self.FirstAddressLineTextFld.text = txt_data

    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]

    } //View Did Load

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func MapButtonTappedTapped(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let kh = storyboard.instantiateViewController(withIdentifier: "AddressPickerViewController") as! AddressPickerViewController
                navigationController?.pushViewController(kh, animated: true)

    }

    @IBAction func PlusBtnTapped(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WorkDetail") as! WorkDetail
        navigationController?.pushViewController(vc, animated: true)
    }

    // Funcntion for CountryList
    @IBAction func CountryList(_ sender: UIButton) {
        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
        self.CountryTextField.text = "\(countryDic["en"] as! String)"
         }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTextField = textField
        if currentTextField == WorkTitleTextField {
            currentTextField.inputView = pickerView
        } else if currentTextField == CityTextField {
            currentTextField.inputView = pickerView
        }
    }

    
    @IBAction func CreateBtnTapped(_ sender: Any) {
        
        activityIndicatorVariable.ActivityIndicator(uiView: self.view)

        //
        var dic = Dictionary<String,AnyObject>()
        dic["email"] = "" as AnyObject
        dic["company"] = "" as AnyObject
        dic["title"] = "" as AnyObject
        dic["address"] = "" as AnyObject
        dic["city"] = "" as AnyObject
        dic["country"] = "" as AnyObject
        
        
//        Utility.shared.showSpinner()
        ALFWebService.shared.doPostData(parameters: dic, method: "saveWork", success: { (response) in
        self.activityIndicatorVariable.ActivityIndicator(uiView: self.view)
            print(response)
//            Utility.shared.hideSpinner()
            if let status = response["status"] as? String {
                if status == "true" {
                    
                    //Setting Values Of Work Email
                    UserDefaults.standard.set(self.WorkEmailTextField.text, forKey: "email")
                    UserDefaults.standard.set(self.CompanyNametextField.text, forKey: "company")
                    UserDefaults.standard.set(self.WorkTitleTextField.text, forKey: "title")
                    UserDefaults.standard.set(self.FirstAddressLineTextFld.text, forKey: "address")
                    UserDefaults.standard.set(self.AddressLineTextField.text, forKey: "secondaddress")
                    UserDefaults.standard.set(self.CityTextField.text, forKey: "city")
                    UserDefaults.standard.set(self.CountryTextField.text, forKey: "country")
   
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "WorkDetails") as! WorkDetails
                    viewController.workEmailValue = self.WorkEmailTextField.text!
                    viewController.companyNameValue = self.CompanyNametextField.text!
                    viewController.workTitleValue = self.WorkTitleTextField.text!
                    viewController.workAddressLine = self.FirstAddressLineTextFld.text!
                    viewController.workAddress2Value = self.AddressLineTextField.text!
                    viewController.cityNameValue = self.CityTextField.text!
                    viewController.countryNameValue = self.CountryTextField.text!
            //      UIApplication.shared.keyWindow?.rootViewController = viewController
                    self.navigationController?.pushViewController(viewController, animated: true)
                } else {
                    print ("navigation contonreller is not workiig")
                }
            }
        }) { (response) in
            print(response)
//            Utility.shared.hideSpinner()
        }
        //
    }
}
extension WorkDetail : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if currentTextField == WorkTitleTextField {
            return pickWorkTitle.count
        } else if currentTextField == CityTextField {
            return cities.count
        } else  {
            return 0
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if currentTextField == WorkTitleTextField {
            WorkTitleTextField.text = pickWorkTitle[row]
            self.view.endEditing(true)
        } else if currentTextField == CityTextField {
            CityTextField.text = cities[row]
            self.view.endEditing(true)
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if currentTextField == WorkTitleTextField {
            return pickWorkTitle[row]
        } else if currentTextField == CityTextField {
            return cities[row]
        } else  {
            return ""
        }
    }
}





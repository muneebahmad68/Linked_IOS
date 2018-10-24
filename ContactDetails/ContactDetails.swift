////
////  ContactDetails.swift
////  Linkd
////
////  Created by Khawar on 10/4/18.
////  Copyright © 2018 Khawar. All rights reserved.
////
//
import UIKit
import Alamofire
import SwiftyJSON

class ContactDetails: UIViewController, UITextFieldDelegate {

//    // Array of Contact Detail
////    var ContactDetailArray : [ContactDetailModel] = []
//
//    // Outlet Of Table View
////    @IBOutlet var tableView: UITableView!

//   // Outlets Of Contact Detail View Controller
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var MobileNumberTextField: UITextField!
    @IBOutlet weak var AltMobileNumberTextField: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var CreatePassword: UITextField!
    @IBOutlet weak var  RepeatPassword: UITextField!
    @IBOutlet weak var SkypeTextField: UITextField!

//    // Outlets for Country Code
    @IBOutlet weak var CountryCodeTextField: UITextField!
    @IBOutlet weak var CountryCodeTextField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//    // Title Of Navigation Bar
//    // self.title = "Contact Details"

//    // change navigation background color
//    // navigationController?.navigationBar.barTintColor = UIColor.blue
//        
//    // change navigation title color e.g check current color is white
//    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
//    
//    // Table View Delegate for Displaying Data in View Controller
////    tableView.dataSource = self
////    tableView.delegate = self
//        
    }   //ViewDidLoad
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    @IBAction func NextBtnTapped(_ sender: Any) {

////        let firstname = FirstName.text!
        
    let firstname = FirstName.text!
    let lastname = LastName.text!
    let email = Email.text!
    let username = Username.text!
    let createpassword = CreatePassword.text!
    let repeatpassword = RepeatPassword.text!

    if firstname != "" && lastname != "" && email != ""  && username != ""  && createpassword != ""  && repeatpassword != "" {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddImage") as! AddImage
        navigationController?.pushViewController(vc, animated: true)
        }

        else {
        
    let alert = UIAlertView()
    alert.title = "Alert"
    alert.message = "All Field are Required"
    alert.addButton(withTitle: "Ok")
    alert.show()
    }

}       // end of class
//
//    // Function for Country Code
    @IBAction func CountryCode(_ sender: Any) {

        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
    //    countryView.displayLanguage = .chinese
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
////    //    self.countryNameLabel.text = "\(countryDic["en"] as! String)"
////    //    self.countryImageView.image = countryDic["countryImage"] as? UIImage
        self.CountryCodeTextField.text = "+\(countryDic["code"] as! NSNumber)"
            }
        }

    @IBAction func CountryCode1(_ sender: Any) {

        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
    //    countryView.displayLanguage = .chinese
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
////    //    self.countryNameLabel.text = "\(countryDic["en"] as! String)"
////    //        self.countryImageView.image = countryDic["countryImage"] as? UIImage
        self.CountryCodeTextField1.text = "+\(countryDic["code"] as! NSNumber)"
            }
        }

    @IBAction func ContactDetailNextBtnTapped(_ sender: Any) {
            let params = ["first_name": FirstName.text!, "last_name": LastName.text!, "e_mail": Email.text!, "mobile_number_textfield": MobileNumberTextField.text!, "alt_mobilenumber_textfield": AltMobileNumberTextField.text!, "user_name": Username.text!, "create_password": CreatePassword.text! , "repeat_password": RepeatPassword.text! , "skype_textfield": SkypeTextField.text!]

            Alamofire.request("http://linkd.gulawano.com/linkdfiver/Service/user_signup", method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in

                print(response.result.value)
                print(response.result.error?.localizedDescription)

                //
                let json = JSON(response.result.value)
                 let SingleContactDetail = ContactDetailModel(contactdetailjson: json["ContactDetailModel"])
//

                for ContactDetailArray in json["ContactDetailModel"].arrayValue {
                let SingleContactDetail = ContactDetailModel(contactdetailjson: json["ContactDetailModel"])
//////              let khawar = ContactDetail (contactdetailjson: ContactDetailArray)
//                self.ContactDetailArray.append(SingleContactDetail)
//
//                    // tableview.reloaddata().
////                    self.tableView.reloadData()

                self.FirstName.text = SingleContactDetail.first_name
                self.LastName.text = SingleContactDetail.last_name
                self.Email.text = SingleContactDetail.e_mail
                self.MobileNumberTextField.text = String(SingleContactDetail.mobile_number_textfield)
                self.AltMobileNumberTextField.text = String(SingleContactDetail.alt_mobilenumber_textfield)
                self.Username.text = SingleContactDetail.user_name
                self.CreatePassword.text = SingleContactDetail.create_password
                self.RepeatPassword.text = SingleContactDetail.repeat_password
                self.SkypeTextField.text = SingleContactDetail.skype_textfield
//
////                    func setData(){
////                        FirstName.text = myContactDetail.first_name
////                        LastName.text = myContactDetail.last_name
////                        Email.text = myContactDetail.e_mail
////                        MobileNumberTextField.text =  String(myContactDetail.mobile_number_textfield)
////                        AltMobileNumberTextField.text = String(myContactDetail.alt_mobilenumber_textfield)
////                        Username.text = myContactDetail.user_name
////                        CreatePassword.text = myContactDetail.create_password
////                        RepeatPassword.text = myContactDetail.repeat_password
////                        SkypeTextField.text = myContactDetail.skype_textfield
////                    }
//                    
        }
            }
    }

}
//
////extension ContactDetails: UITableViewDataSource {
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return self.ContactDetailArray.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////
////        let myContactDetail = self.ContactDetailArray[indexPath.row]
////
////        FirstName.text = myContactDetail.first_name
////        LastName.text = myContactDetail.last_name
////        Email.text = myContactDetail.e_mail
////        MobileNumberTextField.text =  String(myContactDetail.mobile_number_textfield)
////        AltMobileNumberTextField.text = String(myContactDetail.alt_mobilenumber_textfield)
////        Username.text = myContactDetail.user_name
////        CreatePassword.text = myContactDetail.create_password
////        RepeatPassword.text = myContactDetail.repeat_password
////        SkypeTextField.text = myContactDetail.skype_textfield
////
////    }
////
////}








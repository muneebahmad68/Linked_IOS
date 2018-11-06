//
//  SignIn.swift
//  Linkd
//
//  Created by Khawar on 10/4/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignIn: UIViewController, UITextFieldDelegate {

    let activityIndicatorVariable = UIApplication.shared.delegate as! AppDelegate
    
    // Outlets Of Sign In View Controller
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    
 
    
    // Array of Contact Detail
//    var SignInArray : [SignInModel] = []
    
    // Outlet Of Table View
//    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    // Title Of Navigation Bar
    self.title = "Sign In"
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    @IBAction func ForgetPasswordTapped(_ sender: Any) {
        
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ForgetPassword") as! ForgetPassword
    navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TapForRegisterr(_ sender: Any) {
        
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ContactDetails") as! ContactDetails
    navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //
//    func conditionhandling (){
//
//        let username = UserName.text!
//        let password = Password.text!
//
//        if username != "" && password != "" {
//
//            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//            UIApplication.shared.keyWindow?.rootViewController = viewController
//
//             //  navigationController?.pushViewController(vc, animated: true)
//
//
//
//        }
//
//        else {
//            let alert = UIAlertView()
//            alert.title = "Alert"
//            alert.message = "All Field are Required"
//            alert.addButton(withTitle: "Ok")
//            alert.show()
//        }
//
//
//    }
    //
    
    
    @IBAction func LogIn(_ sender: Any) {
        
//        activityIndicatorVariable.ActivityIndicator(uiView: self.view)
//        self.conditionhandling()
        
        
        //
        var dic = Dictionary<String,AnyObject>()
        dic["username"] = UserName.text as AnyObject
        dic["password"] = Password.text as AnyObject
        
        
//        Utility.shared.showSpinner()
        ALFWebService.shared.doPostData(parameters: dic, method: "user_login", success: { (response) in
//            self.activityIndicatorVariable.ActivityIndicator(uiView: self.view)
            print(response)
            
//            Utility.shared.hideSpinner()
            if let status = response["status"] as? String {
                if status == "true" {
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
                       UIApplication.shared.keyWindow?.rootViewController = viewController
                } else {
                    print ("Either username or password is wrong")
                }
            }
        }) { (response) in
            print(response)
//            Utility.shared.hideSpinner()
        }
        //
      
//        let params = ["username": UserName.text!, "password": Password.text!]

//        Alamofire.request("http://linkd.gulawano.com/linkdfiver/Service/user_login", method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//
//            print(response.result.value)
//            print(response.result.error?.localizedDescription)

            // For Checking response From Server

//            switch response.result {
//            case .success:
//            print("You are Logged In.")
                
        // let json = JSON(value)
//          case .success(let value):
//                print(value)
        //  print(json)
                
//            case .failure(let error):
//             print(error)
                
//        print(error.localizedDescription)
//                print("Something is missing")
            }
    
//        let json = JSON(response.result.value)
            
//        let SingleLogIn = SignInModel (signinjson: json["SignInModel"])
//            print(SingleLogIn)
            
//            for signinmodel in json["signinmodel"].arrayValue {
            
//                let SingleLogIn = SignInModel (signinjson: json["SignInModel"])
//                let khawar = SignInModel (signinjson: signinmodel)
//                self.SignInArray.append(khawar)
                
                //
                        // tableview.reloaddata().
//                        self.tableView.reloadData()

    }
//            print(self.SignInArray)
    
//    }
//
//  }

//}

//extension SignIn: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.SignInArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
//
//        let mySignIn = self.SignInArray[indexPath.row]
//
//        UserName.text = mySignIn.user_name
//        Password.text = mySignIn.password
//
//
//        return cell
//    }
//
//}


//
//var dic = Dictionary<String,AnyObject>()
//dic["email"] = emailTxt.text as AnyObject
//dic["password"] = passTxt.text as AnyObject
//dic["device_type"] = "ios" as AnyObject
//dic["LogMeOut"] = logMeOut as AnyObject
//
//Utility.shared.showSpinner()
//ALFWebService.shared.doPostData(parameters: dic, method: "loginMember", success: { (response) in
//    print(response)
//    Utility.shared.hideSpinner()
//    if let status = response["status"] as? Int {
//        if status == 1 || status == 3 {
//            if let member = response["member"] as? Dictionary<String,AnyObject> {
//                if let authorization = member["authorization"] as? String {
//                    UserDefaults.standard.set(authorization, forKey: "authorization")
//
//                    AppDelegate.shared().isCheckLogIn()
//                }
//            }
//        } else if status == 2 {
//            Utility.shared.hideSpinner()
//            Utility.showAlert(title: self.localize!.alert, withMessage: response["message"] as! String, withNavigation: self, withOkBlock: {
//                self.logMeOut = 1
//                self.loginTap((Any).self)
//            }, withCancelBlock: {
//
//            })
//
//
//        } else {
//            Utility.shared.hideSpinner()
//            Utility.showAlertWithTitle(title: self.localize!.alert, withMessage: response["message"] as! String, withNavigation: self)
//        }
//    }
//}) { (response) in
//    print(response)
//    Utility.shared.hideSpinner()
//}
//

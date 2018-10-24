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

    // Outlets Of Sign In View Controller
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

//        UserName.returnKeyType = .next
        
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
        ////        let tempvc = storyboard.instantiateViewController(withIdentifier: )
    let vc = storyboard.instantiateViewController(withIdentifier: "ForgetPassword") as! ForgetPassword
    navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TapForRegisterr(_ sender: Any) {
        
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        let tempvc = storyboard.instantiateViewController(withIdentifier: )
    let vc = storyboard.instantiateViewController(withIdentifier: "ContactDetails") as! ContactDetails
    navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //
    @IBAction func LogIn(_ sender: Any) {
        
        let username = UserName.text!
        let password = Password.text!
        
        if username != "" && password != "" {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
            UIApplication.shared.keyWindow?.rootViewController = viewController
            
            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            ////        let tempvc = storyboard.instantiateViewController(withIdentifier: )
            //        let vc = storyboard.instantiateViewController(withIdentifier: "MyCard") as! MyCard
            //            navigationController?.pushViewController(vc, animated: true)
        }
            
        else {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "All Field are Required"
            alert.addButton(withTitle: "Ok")
            alert.show()
        }  // end of else statement
        
        //
//        let params = ["username": UserName.text!, "password": Password.text!]
//
//        Alamofire.request("http://linkd.gulawano.com/linkdfiver/Service/user_login", method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//
//            print(response.result.value)
//            print(response.result.error?.localizedDescription)
//
//            // For Checking response From Server
//
//            switch response.result {
//            case .success:
//                print("You are Logged In.")
        //  case .success(let value):
        //  let json = JSON(value)
        //  print(json)
//            case .failure(let error):
//             print(error)
//        print(error.localizedDescription)
////                print("Something is missing")
//            }
//
//    } // end of LogIn Function
    //
    }
    
}

//
//  MenuViewController.swift
//  SideMenuViewController
//
//  Created by Khawar on 10/11/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit
import Social

class MenuViewController: UIViewController {

    // Array Of Images and SideMenu Name
    var menuNameArr: Array = [String]()
    var iconeImage: Array = [UIImage]()
    
    @IBOutlet weak var slideMenuUserName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuNameArr = ["Link Up", "Requests", "Appointments", "Events", "Account", "Share App", "Rate the App", "Privacy Policy"]
        
        iconeImage = [UIImage(named: "linkup")!, UIImage(named: "requests")!, UIImage(named: "appointments")!, UIImage(named: "events")!, UIImage(named: "account")!, UIImage(named: "shareapp")!, UIImage(named: "ratetheapp")!, UIImage(named: "privacypolicy")!, ]
        
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "SignIn") as! SignIn
//                navigationController?.pushViewController(vc, animated: true)
          UIApplication.shared.keyWindow?.rootViewController = vc
    }
    



}

extension MenuViewController : UITableViewDataSource, UITableViewDelegate  {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        cell.imgIcon.image = iconeImage[indexPath.row]
        cell.lblMenuName.text! = menuNameArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealViewController: SWRevealViewController = self.revealViewController()

        let cell: MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
     
    // Link Up
        
        if cell.lblMenuName.text! == "Link Up" {
         
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "Links") as! Links
//            let newFrontViewController = UINavigationController.init(rootViewController:desController)
//            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            revealViewController.revealToggle(animated: true)
            let fornt =  revealViewController.frontViewController as! UINavigationController
            fornt.pushViewController(desController, animated: true)
        }
        
    // Requests
        
        if cell.lblMenuName.text! == "Requests" {

            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "Requests") as! Requests
//            let newFrontViewController = UINavigationController.init(rootViewController:desController)
//            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            revealViewController.revealToggle(animated: true)
            let fornt =  revealViewController.frontViewController as! UINavigationController
            fornt.pushViewController(desController, animated: true)
        }
        
    // Appointments
        
        if cell.lblMenuName.text! == "Appointments" {
            
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "AppointmentSearch") as! AppointmentSearch
//            let newFrontViewController = UINavigationController.init(rootViewController:desController)
//            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            revealViewController.revealToggle(animated: true)
            let fornt =  revealViewController.frontViewController as! UINavigationController
            fornt.pushViewController(desController, animated: true)
        }
        
    // Events
        
        if cell.lblMenuName.text! == "Events" {
            
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "EventSearch") as! EventSearch
//            let newFrontViewController = UINavigationController.init(rootViewController:desController)
//            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            revealViewController.revealToggle(animated: true)
            let fornt =  revealViewController.frontViewController as! UINavigationController
            fornt.pushViewController(desController, animated: true)
        }
        
    // Account
        
        if cell.lblMenuName.text! == "Account" {
            
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "Account") as! Account
//            let newFrontViewController = UINavigationController.init(rootViewController:desController)
//            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            revealViewController.revealToggle(animated: true)
            let fornt =  revealViewController.frontViewController as! UINavigationController
            fornt.pushViewController(desController, animated: true)
        }
        
    //  PrivacyPolicy
        
        if cell.lblMenuName.text! == "Privacy Policy" {
            
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "PrivacyPolicy") as! PrivacyPolicy
            //            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            //            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            revealViewController.revealToggle(animated: true)
            let fornt =  revealViewController.frontViewController as! UINavigationController
            fornt.pushViewController(desController, animated: true)
        }
        
    //  Share App
        
        if cell.lblMenuName.text! == "Share App" {
    
            
            // Create Alert
            let selectServiceAlert = UIAlertController(title: "Select Service", message: "Select Service", preferredStyle: .actionSheet)
            
            // create action Buttons
            let facebookActionButton = UIAlertAction(title: "Facebook", style: .default) { (action) in
                
                if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                    
                    // Create Post View
                    let facbookPostView = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                    
                    // Set default Post
                    facbookPostView?.setInitialText("This post was written by my app")
                    
                    // Display Post view
                    self.present(facbookPostView!, animated: true, completion: nil)
                    
                }
                else {
                    self.error(serviceType: "Facebook")
                }
                
            }
            
            // create action Buttons for Twitter
            let twitterActionButton = UIAlertAction(title: "Twitter", style: .default) { (action) in
                
                if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                    
                    // Create Post View
                    let twitterPostView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                    
                    // Set default Post
                    twitterPostView?.setInitialText("This post was written by my app")
                    
                    // Display Post view
                    self.present(twitterPostView!, animated: true, completion: nil)
                    
                }
                else {
                    self.error(serviceType: "Twitter")
                }
                
            }
            
            
            let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            // Add actions to Alert
            selectServiceAlert.addAction(facebookActionButton)
            selectServiceAlert.addAction(twitterActionButton)
            selectServiceAlert.addAction(cancelActionButton)
            
            // Display the Alert
            self.present(selectServiceAlert, animated: true, completion: nil)
        }
        //
        
        
    //    Rate The App
        
        if cell.lblMenuName.text! == "Rate the App" {
            
//            UIApplication.shared.openURL(NSURL(string : "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(1081797746)&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software)")! as URL);
            
            UIApplication.shared.openURL(NSURL(string : "http://itunes.com/apps/myappnameinlowercase")! as URL);
        }
        

}
    
    // Function For Share the App
    
    func error(serviceType: String) {
        
        //  Create Alert
        let errorAlert = UIAlertController(title: "Unavailable", message: "Your Device is not connected to \(serviceType)", preferredStyle: .alert)
        
        // Create the action
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        // Add Actions
        errorAlert.addAction(okAction)
        
        //Display Alert
        self.present(errorAlert, animated: true, completion: nil)
        
    }
    //

}  // class view controller 


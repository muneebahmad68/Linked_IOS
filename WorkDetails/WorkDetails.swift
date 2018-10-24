//
//  WorkDetails.swift
//  Linkd
//
//  Created by Khawar on 10/8/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class WorkDetails: UIViewController, UITextFieldDelegate {

    // Outlets for Work Details
    @IBOutlet weak var WorkEmail1TextField: UITextField!
    @IBOutlet weak var CompanyName1textField: UITextField!
    @IBOutlet weak var WorkTitle1TextField: UITextField!
    @IBOutlet weak var AddressLine1TextField: UITextField!
    //
    
    
    // Outlet for CountryList
    @IBOutlet weak var CountryTextField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // Title Of Navigation Bar
    self.title = "Work Details"
        
    // change navigation background color
    //  navigationController?.navigationBar.barTintColor = UIColor.blue
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
      
                                } //View Did Load

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CompleteButtonTapped(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        UIApplication.shared.keyWindow?.rootViewController = vc
    //  navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func CountryList1(_ sender: UIButton) {
        
        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
    //  countryView.displayLanguage = .chinese
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
        self.CountryTextField1.text = "\(countryDic["en"] as! String)"
        // self.countryImageView.image = countryDic["countryImage"] as? UIImage
    //   self.countryCodeLabel.text = "+\(countryDic["code"] as! NSNumber)"
        }
    }

}

//
//  EditCard.swift
//  Linkd
//
//  Created by Khawar on 10/8/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class EditCard: UIViewController, UITextFieldDelegate {

    // Outlets for Work Detail
    @IBOutlet weak var WorkEmail1TextField: UITextField!
    @IBOutlet weak var CompanyName1TextField: UITextField!
    @IBOutlet weak var WorkTitle1TextField: UITextField!
    @IBOutlet weak var AddressLine1TextField: UITextField!
    //
    
    // Outlet for Country List
    @IBOutlet weak var CountryTextField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    // Title Of Navigation Bar
    self.title = "Edit Card"
        
    // change navigation background color
    //  navigationController?.navigationBar.barTintColor = UIColor.blue
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
                                }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Requests") as! Requests
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Function for Country List 
    @IBAction func CountryList2(_ sender: UIButton) {
        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
        // countryView.displayLanguage = .chinese
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
        self.CountryTextField2.text = "\(countryDic["en"] as! String)"
        // self.countryImageView.image = countryDic["countryImage"] as? UIImage
        // self.countryCodeLabel.text = "+\(countryDic["code"] as! NSNumber)"
        }
    }

}


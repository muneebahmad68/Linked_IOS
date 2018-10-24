
//  WorkDetail.swift
//  Linkd
//
//  Created by Khawar on 10/4/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class WorkDetail: UIViewController, UITextFieldDelegate {

    // Outlets for Work Detail
    @IBOutlet weak var WorkEmailTextField: UITextField!
    @IBOutlet weak var CompanyNametextField: UITextField!
    @IBOutlet weak var WorkTitleTextField: UITextField!
    @IBOutlet weak var FirstAddressLineTextFld: NextResponderTextField!
    @IBOutlet weak var AddressLineTextField: UITextField!
    //

//     variable for location/address picker
    var txt_data = ""

    //Outlet for CountryList
    @IBOutlet weak var CountryTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // for location/address picker
        self.FirstAddressLineTextFld.text = txt_data

////    // Title Of Navigation Bar
////    // self.title = "Work Details"
////
////    // change navigation background color
////    // navigationController?.navigationBar.barTintColor = UIColor.blue

////    // change navigation title color e.g check current color is white
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
////////        UIApplication.shared.keyWindow?.rootViewController = kh

    }

    @IBAction func PlusBtnTapped(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WorkDetail") as! WorkDetail
        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func CreateBtnTapped(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WorkDetails") as! WorkDetails
        navigationController?.pushViewController(vc, animated: true)
//        UIApplication.shared.keyWindow?.rootViewController = vc

    }

    // Funcntion for CountryList
    @IBAction func CountryList(_ sender: UIButton) {
        let countryView = CountrySelectView.shared
        countryView.barTintColor = .red
////    //    countryView.displayLanguage = .chinese
        countryView.show()
        countryView.selectedCountryCallBack = { (countryDic) -> Void in
        self.CountryTextField.text = "\(countryDic["en"] as! String)"
    //    self.countryImageView.image = countryDic["countryImage"] as? UIImage
    //    self.countryCodeLabel.text = "+\(countryDic["code"] as! NSNumber)"
         }
    }

}

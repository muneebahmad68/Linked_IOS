//
//  AddImage.swift
//  Linkd
//
//  Created by Khawar on 10/4/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddImage: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let activityIndicatorVariable = UIApplication.shared.delegate as! AppDelegate
    
    // Outlets For Image Picker From Library
    @IBOutlet weak var PickImageFromLibrary: UIImageView!
    
    // Function For Selecting Image From Iphone
    
    @IBAction func ImagePickerButton(_ sender: UIButton) {
        
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imageController, animated: true, completion: nil)
    
    }
    
    // Function for Moving Image to View Controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

    PickImageFromLibrary.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    self.dismiss(animated: true, completion: nil)

        // convert image into string
//        let imageData:NSData = UIImagePNGRepresentation(PickImageFromLibrary.image!)! as NSData
//        let imageStr = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
//        print(imageStr)

//        let imageData: Data? = UIImageJPEGRepresentation(PickImageFromLibrary.image!, 0.4)
//        let imageStr = imageData?.base64EncodedString(options: .lineLength64Characters) ?? ""
//        print(imageStr)


    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
   
    } // View Did Load
    

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
   

    @IBAction func NextBtnTapped(_ sender: Any) {

        activityIndicatorVariable.ActivityIndicator(uiView: self.view)
        
        var dic = Dictionary<String,AnyObject>()
        dic["user_id"] =  UserDefaults.standard.object(forKey: "user_id") as AnyObject
       
        
        //
        if PickImageFromLibrary.image == nil {
             Utility.showAlertWithTitle(title: "Missing", withMessage: "Image is missing", withNavigation: self)
            return
        }
        //
        
       //
        let convertedDict: [String: String] = dic.mapPairs { (key, value) in
            (key, String(describing: value))
        }
        //
        
        //        Utility.shared.showSpinner()
        ALFWebService.shared.doPostDataWithImage(parameters: convertedDict as! [String : String], method: "uploadImage", image: PickImageFromLibrary.image, success: { (response) in
            print(response)
            
            self.activityIndicatorVariable.ActivityIndicator(uiView: self.view)
            
            if let status = response["status"] as? String {
                if status == "true" {
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "WorkDetail") as! WorkDetail
//                    UIApplication.shared.keyWindow?.rootViewController = viewController
                    self.navigationController?.pushViewController(viewController, animated: true)
                } else {
                    print ("Your Informatioin is not correct")
                }
            }
            
        }) { (response) in
            print(response)
        }
        
    }
}


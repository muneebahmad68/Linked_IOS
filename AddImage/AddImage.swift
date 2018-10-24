//
//  AddImage.swift
//  Linkd
//
//  Created by Khawar on 10/4/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class AddImage: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

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
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // Title Of Navigation Bar
    // self.title = "Add Image"
       
    // change navigation background color
    // navigationController?.navigationBar.barTintColor = UIColor.blue
        
    // change navigation title color e.g check current color is white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
   
       
    } // View Did Load

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func NextBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WorkDetail") as! WorkDetail
        
//                let vc = storyboard.instantiateViewController(withIdentifier: "WorkDetail") as! workde
        
        navigationController?.pushViewController(vc, animated: true)
    
    }
}

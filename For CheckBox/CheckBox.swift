//
//  CheckBox.swift
//  Linkd
//
//  Created by Khawar on 10/15/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    let CheckImage = UIImage(named: "checkboxfill") as! UIImage
    let UnCheckImage = UIImage(named: "checkboxempty") as! UIImage
    
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(CheckImage, for: .normal)
            }
            else {
                self.setImage(UnCheckImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        
    self.addTarget(self, action: #selector(revealBackClicked), for: UIControlEvents.touchUpInside)
    self.isChecked = false
    }
    
    @objc func revealBackClicked(sender: UIButton){
        if (sender == self) {
            if isChecked == true {
                isChecked = false
            }
            else {
                isChecked = true
            }
        }
    }
    
}



//
//  CustomView.swift
//  Linkd
//
//  Created by Khawar on 10/4/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import Foundation
import UIKit

    class CornerView: UIView {
        
        override func awakeFromNib() {
            layer.cornerRadius = 5
            layer.masksToBounds = true
            
        }
    }

    class RoundedButton: UIButton {
        
        override func awakeFromNib() {
            layer.cornerRadius = 5
            layer.masksToBounds = true
            
        }
    }

    class RoundedImage: UIImageView {
        
        override func awakeFromNib() {
            layer.cornerRadius = 5
            layer.masksToBounds = true
            
        }
    }

    class ProfileImageView: UIImageView {

        override func awakeFromNib() {
            layer.cornerRadius = self.frame.size.width / 2;
            layer.masksToBounds = true

        }
    }

//class SpaceFromLeft: UITextField {
//
//    override func awakeFromNib() {
//
//        layer.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
//        layer.leftViewMode = .always
////        layer.cornerRadius = self.frame.size.width / 2;
////        layer.masksToBounds = true
//
//    }
//}


//class ProfileImageView: UIView {
//
//    override func awakeFromNib() {
//        continueBtn.layer.cornerRadius = 20
//        layer.cornerRadius = self.frame.size.width / 2;
//        layer.masksToBounds = true
//
//    }
//}




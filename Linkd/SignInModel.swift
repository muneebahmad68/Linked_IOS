//
//  SignInModel.swift
//  Linkd
//
//  Created by Khawar on 10/23/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit
import SwiftyJSON

struct SignInModel {
    
    var user_name = ""
    var password = ""

    var messagee = ""
    
    init(signinjson: JSON) {
    
      self.user_name = signinjson["username"].stringValue
      self.password = signinjson["password"].stringValue
//        self.messagee = signinjson["message"].stringValue

    
        
    }
}


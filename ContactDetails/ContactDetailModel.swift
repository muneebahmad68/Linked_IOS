//
//  ContactDetailModel.swift
//  Linkd
//
//  Created by Khawar on 10/22/18.
//  Copyright © 2018 Khawar. All rights reserved.
//

import UIKit
import SwiftyJSON

struct ContactDetailModel {
    
    var userID = 0
//    var first_name = ""
//    var last_name = ""
//    var e_mail = ""
//    var mobile_number_textfield = 0
//    var alt_mobilenumber_textfield = 0
//    var user_name = ""
//    var create_password = ""
//    var repeat_password = ""
//    var skype_textfield = ""
    
    init(contactdetailjson: JSON) {
        
        self.userID = contactdetailjson["user_id"].intValue
        
//        self.first_name = contactdetailjson["first_name"].stringValue
//        self.last_name = contactdetailjson["last_name"].stringValue
//        self.e_mail = contactdetailjson["email"].stringValue
//        self.mobile_number_textfield = contactdetailjson["phone"].intValue
//        self.alt_mobilenumber_textfield = contactdetailjson["phone_2"].intValue
//        self.user_name = contactdetailjson["username"].stringValue
//        self.create_password = contactdetailjson["password"].stringValue
//        self.repeat_password = contactdetailjson["repeat_password"].stringValue
//        self.skype_textfield = contactdetailjson["skype_id"].stringValue
        
    }
}

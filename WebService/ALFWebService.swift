//
//  WebService.swift
//  BrandsPK
//
//  Created by Naveed on 12/1/16.
//  Copyright © 2016 Technation. All rights reserved.
//

import UIKit
import Alamofire

typealias SuccessBlock = (_ response: AnyObject) -> Void
typealias FailureBlock = (_ response: AnyObject) -> Void

class ALFWebService: NSObject {
    
    
    static let shared = ALFWebService()
    
    //    private override init() {
    //
    //    }
    
    private func urlString(subUrl: String) -> String {
        
        return "http://linkd.gulawano.com/linkdfiver/Service/\(subUrl)"
        
    }
    
    /****************************  ***********************************/
    /******************* GET Method with PARAMS **********************/
    /****************************  ***********************************/
    
    func doGetData(parameters: Dictionary<String, AnyObject>, method: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
        print(parameters)
        self.getMethodWithParams(parameters: parameters as Dictionary<String, AnyObject>, forMethod: self.urlString(subUrl: method), success: success, fail: fail)
    }
    
    private func getMethodWithParams(parameters: Dictionary<String, AnyObject>, forMethod: String, success:@escaping SuccessBlock, fail:@escaping FailureBlock){
        
        var headers: HTTPHeaders?
        if UserDefaults.standard.object(forKey: "authorization") != nil {
            headers = ["authorization":UserDefaults.standard.object(forKey: "authorization") as! String]
        } else {
            headers = [:]
        }
        

    
        let manager = Alamofire.SessionManager.default
               print(headers)
        manager.session.configuration.timeoutIntervalForRequest = 30
        print(parameters)
        manager.request(forMethod, method: .get, parameters: parameters, headers: headers).responseJSON { response in
            print(parameters)
            print(headers)
            switch(response.result) {
            case .success(_):
                
                if response.result.value != nil{
                    success(response.result.value as AnyObject)
                }
                break
                
            case .failure(_):
                fail(response.result.error as AnyObject)
                break
            }
        }
        
    }
    
    
    /******************* END OF GET Method with PARAMS **********************/
    
    
    /****************************  ***********************************/
    /******************* POST Method with PARAMS *********************/
    /****************************  ***********************************/
    
    func doPostData(parameters: Dictionary<String, AnyObject>, method: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
        print(parameters)
        self.postMethodWithParams(parameters: parameters, forMethod: self.urlString(subUrl: method), success: success, fail: fail)
    }
    
    private func postMethodWithParams(parameters: Dictionary<String, AnyObject>, forMethod: String, success:@escaping SuccessBlock, fail:@escaping FailureBlock){
        var headers: HTTPHeaders?
        
        if UserDefaults.standard.object(forKey: "authorization") != nil {
            headers = ["authorization":UserDefaults.standard.object(forKey: "authorization") as! String]
        } else {
            headers = [:]
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        print(headers)
        manager.request(forMethod, method: .post, parameters: parameters,  headers: headers).responseJSON { response in
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print(headers)
                    success(response.result.value as AnyObject)
                }
                break
                
            case .failure(_):
                fail(response.result.error as AnyObject)
                
                break
            }
        }
        
    }
    /******************* END OF POST Method with PARAMS **********************/
    
    
    /****************************  ***********************************/
    /*************** POST Method with PARAMS and IMAGE *******************/
    /****************************  ***********************************/
    func doPostDataWithImage(parameters: [String:String], method: String, image: UIImage?, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
        
        self.postMethodWithParamsAndImage(parameters: parameters, forMethod: self.urlString(subUrl: method), image: image, success: success, fail: fail)
    }
    
    private func postMethodWithParamsAndImage(parameters: [String:String], forMethod: String, image: UIImage?, success:@escaping SuccessBlock, fail:@escaping FailureBlock){
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        let headers: HTTPHeaders?
        
        if UserDefaults.standard.object(forKey: "authorization") != nil {
            headers = ["authorization":UserDefaults.standard.object(forKey: "authorization") as! String]
        } else {
            headers = [:]
        }
        
        manager.upload(
            multipartFormData: { multipartFormData in
                print(parameters)
                print(image as Any)
                if image != nil {
                    
                    var imgData = (image?.jpeg(.medium))!
                    
                    print(imgData.count)
                    
                    multipartFormData.append(imgData, withName: "user_image", fileName: "user_image.png", mimeType: "image/png")
                    
                }
                if !(parameters.isEmpty) {
                    for (key, value) in parameters {
                        print("key: \(key) -> val: \(value)")
                        if let dic = value as? Dictionary<String,AnyObject>{
                            print(key)
                            print(value)
                            do {
                                let jsonData = try JSONSerialization.data(withJSONObject: dic, options: [])
                                let str = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                                //                                multipartFormData.append(jsonData, withName: key)
                                multipartFormData.append(str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                        }else{
                            multipartFormData.append(value.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                        }
                        
                    }
                }
                print(multipartFormData)
        },
            to: forMethod,  method: .post, headers: headers, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        
                        success(response.result.value as AnyObject)
                    }
                case .failure(let encodingError):
                    
                    fail(encodingError as AnyObject)
                }
        })
        
        
        
        
    }
    /******************* END OF POST Method with PARAMS and IMAGE **********************/
    
}

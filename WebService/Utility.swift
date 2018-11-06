import UIKit
import Photos
import SystemConfiguration


var appName = "Pedia Club"

typealias OkBlock = () -> Void
typealias cancelBlock = () -> Void

class Utility: NSObject
{
    static let shared = Utility()
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    class func isValidEmail(testStr:String) -> Bool
    {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func isLoggedIn() -> Bool {
        
        if (UserDefaults.standard.object(forKey: "authorization") != nil) {
            // perform your task here
            return true
        }else  {
            return false
        }
        
    }
    class func logout() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)

    }
    class func isCompany() -> Bool {
        
        if (UserDefaults.standard.object(forKey: "user_type")  as! String == "1") {
            // perform your task here
            return true
        }else  {
            return false
        }
        
    }
    public func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
//        manager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
//            thumbnail = result!
//        })
        manager.requestImageData(for: asset, options: option) { data, str, _, _ in

            if let data = data {
                thumbnail = UIImage(data: data)!
            }
        }
    
        return thumbnail
        
    }
    public func showActivityIndicatory(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        //        container.backgroundColor = UIColor.init(netHex: 0xffffff).withAlphaComponent(0.3) //UIColorFromHex(0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //        activityIndicator.activityIndicatorViewStyle =
        //            UIActivityIndicatorViewStyle.white
        activityIndicator.color = UIColor(hexString: "#555555")
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,y :loadingView.frame.size.height / 2)
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        uiView.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    public func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        uiView.isUserInteractionEnabled = true
        container.removeFromSuperview()
    }
    private func setSpinner() {
        let window = UIApplication.shared.keyWindow!
        
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        loadingView.backgroundColor = UIColor(hexString: "#4788F2").withAlphaComponent(0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        activityIndicator.color = UIColor(hexString: "#FFFFFF")
        activityIndicator.tintColor = UIColor(hexString: "#FFFFFF")
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,y :loadingView.frame.size.height / 2)
        loadingView.addSubview(activityIndicator)
        loadingView.center = window.center
        window.addSubview(loadingView)
        
        window.isUserInteractionEnabled = false
        //        container.addSubview(loadingView)
        //        uiView.addSubview(container)
        //        uiView.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    public func showSpinner() {
        DispatchQueue.main.async {
            self.setSpinner()
        }
    }
    public func hideSpinner() {
        DispatchQueue.main.async {
            self.removeSpinner()
        }
    }
    private func removeSpinner() {
        let window = UIApplication.shared.keyWindow!
        
        activityIndicator.stopAnimating()
        window.isUserInteractionEnabled = true
        //        uiView.isUserInteractionEnabled = true
        loadingView.removeFromSuperview()
    }
    class func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = NSDate()
        let earliest = now.earlierDate(date as Date)
        let latest = (earliest == now as Date) ? date : now
        var components = calendar.dateComponents(unitFlags, from: earliest as Date,  to: latest as Date)
        print(components)
        components.hour = components.hour! - 5
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
        
    }
    
    
    class func isConnectedToNetwork() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                
                SCNetworkReachabilityCreateWithAddress(nil, $0)
                
            }
            
        }) else {
            
            return false
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    class func dateFromStringConvertToString(_ stringDate: String) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: stringDate)
        //        dateFormatter.dateFormat =  "hh:mm a"
        //        let  newTime =  dateFormatter.string(from: date!)
        dateFormatter.dateFormat = "d MMM, yyyy"
        let newDate = dateFormatter.string(from: date!)
        return newDate
    }
    class func stringFromDateWithFormat(_ date: Date, format: String) -> String  {
        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MMM-dd hh:mm a"
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    class func dateFromString(_ stringDate: String) -> Date  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date = dateFormatter.date(from: stringDate)
        //        let calendar = Calendar.current
        //        let newDate = calendar.date(byAdding: .hour, value: 5, to: date!)
        return date!
    }
    
    //    class func dateFromString(_ stringDate: String) -> Date  {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    //        let date = dateFormatter.date(from: stringDate)
    //
    //        return date! as Date
    //    }
    
    class func stringFromDate(_ date: Date) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd hh:mm a"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    class func dateDtringFromDate(_ date: Date) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    class func timeDtringFromDate(_ date: Date) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    class func showAlertWithTitle(title: String, withMessage: String, withNavigation: UIViewController) {
        
        let alert = UIAlertController(title: title, message: withMessage, preferredStyle: .alert)
        
        
        let okAction : UIAlertAction = UIAlertAction(title: "OK", style: .default){
            ACTION -> Void in
            
            
        }
        
        alert.addAction(okAction)
        
        withNavigation.present(alert, animated: true, completion: nil)
    }
    //    class func downloadImageForImageView(imageView: UIImageView, url: String) -> Void
    //    {
    //        let imageRequest = NSURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
    //
    //        imageView.setImageWith(imageRequest as URLRequest, placeholderImage: UIImage(named: "user-3"), success: nil, failure: nil)
    //    }
    //
    //    class func downloadImageForButton(button: UIButton, url: String) -> Void
    //    {
    //        let imageRequest = NSURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
    //
    //        button.setBackgroundImageFor(.normal, with: imageRequest as URLRequest, placeholderImage: UIImage(named: "user-3"), success: nil, failure: nil)
    //    }
    static let numberFormater: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.formatterBehavior = .default
        return formatter
    }()
}


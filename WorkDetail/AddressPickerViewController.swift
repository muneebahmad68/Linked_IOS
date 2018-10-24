////
////  AddressPickerViewController.swift
////  Linkd
////
////  Created by Khawar on 10/22/18.
////  Copyright © 2018 Khawar. All rights reserved.
////
//
//import UIKit
//
//class AddressPickerViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}


import UIKit
import MapKit
import CoreLocation


class AddressPickerViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var locationManager = CLLocationManager()
    
    @IBAction func Next(_ sender: Any) {
        if let kh = self.storyboard?.instantiateViewController(withIdentifier: "WorkDetail") as? WorkDetail
        {
            kh.txt_data = addressLabel.text ?? ""
                        self.navigationController!.pushViewController(kh, animated: true)
            //              self.navigationController!.presentingViewController(kh, animated: true)
            //            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            //            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//            UIApplication.shared.keyWindow?.rootViewController = kh
            
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //        let kh = storyboard.instantiateViewController(withIdentifier: "AddressPickerViewController") as! AddressPickerViewController
            //                navigationController?.pushViewController(kh, animated: true)
            ////        UIApplication.shared.keyWindow?.rootViewController = kh
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    
    
    //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentlocation = locations[0]
        
        let latitude = currentlocation.coordinate.latitude
        let longitude = currentlocation.coordinate.longitude
        
        // for display
        //        self.latitudeLabel.text = String(latitude)
        //        self.longitudeLabel.text = String(longitude)
        //        self.CourseLabel.text = String(currentlocation.course)
        //        self.speedLabel.text = String(currentlocation.speed)
        //        self.altitudeLabel.text = String("\(currentlocation.altitude) Meters")
        //
        
        
        
        
        let latDelta: CLLocationDegrees = 0.005
        let lonDelta: CLLocationDegrees = 0.005
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let locationCordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: locationCordinate, span: span)
        
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
        //map.showsCompass = true
        map.showsPointsOfInterest = false
        
        CLGeocoder().reverseGeocodeLocation(currentlocation){
            placemarks, error in
            
            if let placemark = placemarks?[0]{
                //-==++   ++==---//
                
                /* 1 */    var subToroughfare = ""
                
                if placemark.subThoroughfare != nil {
                    
                    subToroughfare = placemark.subThoroughfare!
                    
                } // end
                
                /* 2 */       var toroughfare = ""
                
                if placemark.thoroughfare != nil {
                    
                    toroughfare = placemark.thoroughfare!
                    
                } // end
                
                /* 3 */       var subLocality = ""
                
                if placemark.subLocality != nil {
                    
                    subLocality = placemark.subLocality!
                    
                } // end
                
                /* 4 */      var subAdministrativeArea = ""
                
                if placemark.subAdministrativeArea != nil {
                    
                    subAdministrativeArea = placemark.subAdministrativeArea!
                    
                } // end
                
                /* 4 */      var postalCode = ""
                
                if placemark.postalCode != nil {
                    
                    postalCode = placemark.postalCode!
                    
                } // end
                
                /* 4 */      var country = ""
                
                if placemark.country != nil {
                    
                    country = placemark.country!
                    
                    
                } // end
                
                
                
                let address =  String(subToroughfare + " " + toroughfare + " " + subLocality + "\n " + subAdministrativeArea + " " + postalCode + " " + country  )
                
                //  print(address)
                
                self.addressLabel.text = address
                
                //-==++   ++==---//
            } else {
                
                print("Error")
                
            }
            
        }
        
    }
}





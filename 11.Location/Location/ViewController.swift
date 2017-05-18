//
//  ViewController.swift
//  Location
//
//  Created by suckerl on 2017/5/17.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
 
    @IBOutlet weak var resultLabel: UILabel!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func locationButtonClick(_ sender: UIButton) {
    
        manager.delegate = self
        
        //设置精确度
        manager.desiredAccuracy = kCLLocationAccuracyBest
        //
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
}

extension ViewController : CLLocationManagerDelegate {
    
    //授权状态发生改变的时候的的回调
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    //didFailWithError
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error is \(error)")
    }
    
    //didUpdateLocations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if locations.count > 0 {
            manager.stopUpdatingLocation()

            guard let location = manager.location else {
                return
            }
            
            //解析请求到的location
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placeMark, error) in
                
                //错误解释
                if (error != nil) {
                    self.resultLabel.text = "Failed with error" + (error!.localizedDescription)
                    return
                }
                
                if (placeMark == nil) {
                    self.resultLabel.text = "Failed"
                }else {
                
                    let place = placeMark?[0]
//                    print(place?.locality ?? "")
//                    print(place?.country ?? "")
//                  print(place?.postalCode ?? "")
//                    print(place?.administrativeArea ?? "")
                    let locality = place?.locality ?? ""
                    let country = place?.country ?? ""
                    let area = place?.administrativeArea ?? ""
                    
                    self.resultLabel.text = locality + "-" + area + "-" + country
                }
            })
        }
    }
}


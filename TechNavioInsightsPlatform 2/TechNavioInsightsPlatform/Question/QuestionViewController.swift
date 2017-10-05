//
//  QuestionViewController.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 28/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class QuestionViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var mailTxtFld: UITextField!
    @IBOutlet weak var dingBtn: UIButton!
    @IBAction func dingTapped(_ sender: Any) {
        let subVC = SubQuesViewController(nibName: "SubQuesViewController", bundle: nil)
        subVC.delegate = self
        self.navigationController?.pushViewController(subVC, animated: true)
    }
    @IBOutlet weak var mapdfdfVw: MKMapView!
    @IBOutlet weak var statusLvl: UILabel!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input = "abcdef"
        let output = input.reverseStr()
        print(output)
        
        let arr : [Int] = [45,23,6,23,1,67,9,62]
        self.repeatWords(arrayToChech: arr)
        
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        let noLocation = CLLocationCoordinate2D()
        let viewRegion = MKCoordinateRegionMakeWithDistance(noLocation, 200, 200)
        mapdfdfVw.setRegion(viewRegion, animated: false)

         
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        print(Singleton.instance.getValue())
        Singleton.instance.nameUser = "wonderful"
        print(Singleton.instance.getValue())
        Singleton.instance.setValue(name: "wild")
        
        
                // Do any additional setup after loading the view.
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let newLocation = locations.last!
        print("current position: \(newLocation.coordinate.longitude) , \(newLocation.coordinate.latitude)")
        
        let loc = locations[0]
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let myLoc = CLLocationCoordinate2DMake(loc.coordinate.latitude, loc.coordinate.longitude)
        let regi = MKCoordinateRegionMake(myLoc, span)
        mapdfdfVw.setRegion(regi, animated: true)
        statusLvl.text = "\(loc.speed)"
    }
    
    func repeatWords(arrayToChech :[Int]) -> [Int] {
        let count : Int = arrayToChech.count
        
        
        
        for i in 0..<count-1 {
            for j in 1..<count-1 {
                if arrayToChech[i] > arrayToChech[j] {
                    
                }
                print(arrayToChech[i],arrayToChech[j])
            }
        }
        
        return []
    }

}


extension QuestionViewController : BtnDelegate{
    func changeText() {
        print("text changed")
        dingBtn.titleLabel?.text = "dong"
    }
}

extension String{

    func reverseStr () -> String{
        print(self)
        var newStr : String = ""
        var charArr = Array(self.characters)
        let count = charArr.count
        
        for i in stride(from: count-1, to: -1, by: -1){
            print(charArr[i])
            newStr.append(charArr[i])
        }
        return newStr
    }
}








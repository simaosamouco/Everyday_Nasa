//
//  PerfilAsteroidViewController.swift
//  EverydayNASA
//
//  Created by Simão Samouco on 29/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit
import iOSDropDown

class PerfilAsteroidViewController: UIViewController {

    @IBOutlet weak var MissDistanceLabel: UILabel!
    @IBOutlet weak var orbitLabel: UILabel!
    @IBOutlet weak var closeApproachLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var velocity: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dropDown: DropDown!
    
    var asteroidReceived: Asteroid!
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.optionArray = ["Kilometers/hour | Meters", "Miles/hour | Feet", "Kilometers/hour | Feet", "Miles/hour | Meters" ]
        nameLabel.text = asteroidReceived.name
        magnitudeLabel.text = "Absolute Magnitude : \(asteroidReceived.absolute_magnitude)"
        MissDistanceLabel.text = "Miss Distance : \(asteroidReceived.closeApproach[0].missDistance.astronomical) (Astronomical)"
        orbitLabel.text = "Orbits Around : \(asteroidReceived.closeApproach[0].orbiting_body)"
        closeApproachLabel.text = "Closes Approach to Earth Date : \(asteroidReceived.closeApproach[0].close_approach_date)"
        diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_m) and \(asteroidReceived.diameters.max_diameter_m)"
        velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.kilometersPerSecond)"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMeToNasa(_ sender: Any) {
    }
    /*
    func listDidDisappear(){
        if(dropDown.selectedIndex == 0){
            diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_m) meters and \(asteroidReceived.diameters.max_diameter_m) meters"
            velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.kilometersPerSecond) km/hour"
        }else if(dropDown.selectedIndex == 1){
            diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_f) feet and \(asteroidReceived.diameters.max_diameter_f) feet"
            velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.milesPerHour) miles/hour"
        }else if(dropDown.selectedIndex == 2){
            diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_f) feet and \(asteroidReceived.diameters.max_diameter_f) feet"
            velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.kilometersPerSecond) km/hour"
        }else if(dropDown.selectedIndex == 3){
            diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_m) meters and \(asteroidReceived.diameters.max_diameter_f) meters"
            velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.milesPerHour) miles/hour"
        }
    }*/
    
   
    
    

}

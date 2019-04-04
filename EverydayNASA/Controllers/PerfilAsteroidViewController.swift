//
//  PerfilAsteroidViewController.swift
//  EverydayNASA
//
//  Created by Simão Samouco on 29/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit
import iOSDropDown
import SafariServices

class PerfilAsteroidViewController: UIViewController {

    @IBOutlet weak var MissDistanceLabel: UILabel!
    @IBOutlet weak var orbitLabel: UILabel!
    @IBOutlet weak var closeApproachLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var velocity: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dropDown: DropDown!
    
    let defaults = UserDefaults.standard
   // let lann = defaults.string(forKey: "Language")
    
    var asteroidReceived: Asteroid!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //defaults.set(1, forKey: "selectedIndexAux")
         dropDown.selectedIndex = defaults.integer(forKey: "selectedIndexAux")
        
        
        
        dropDown.placeholder = "Kilometers/hour | Meters"
        dropDown.didSelect(){_,_,_ in
            self.listDidDisappear()
        }
        
        dropDown.optionArray = ["Kilometers/hour | Meters", "Miles/hour | Feet", "Kilometers/hour | Feet", "Miles/hour | Meters" ]
        nameLabel.text = asteroidReceived.name
        if let mag = asteroidReceived.absolute_magnitude{
            magnitudeLabel.text = "Absolute Magnitude : \(mag)"
        }
        //agnitudeLabel.text = "Absolute Magnitude : \(asteroidReceived.absolute_magnitude)"
        MissDistanceLabel.text = "Miss Distance : \(asteroidReceived.closeApproach[0].missDistance.astronomical) (Astronomical)"
        if let orbit = asteroidReceived.closeApproach[0].orbiting_body{
            orbitLabel.text = "Orbits Around : \(orbit)"
        }
        //rbitLabel.text = "Orbits Around : \(asteroidReceived.closeApproach[0].orbiting_body)"
        if let closest = asteroidReceived.closeApproach[0].close_approach_date{
            closeApproachLabel.text = "Closest Approach to Earth Date : \(closest)"
        }
        //closeApproachLabel.text = "Closest Approach to Earth Date : \(asteroidReceived.closeApproach[0].close_approach_date)"
        if let di_min = asteroidReceived.diameters.min_diameter_m {
            if let di_max = asteroidReceived.diameters.max_diameter_m{
                diameterLabel.text = "Diameter between \(di_min) and \(di_max) meters"
            }
        }
        //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_m) and \(asteroidReceived.diameters.max_diameter_m)"
        velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.kilometersPerSecond)"
        
        listDidDisappear()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMeToNasa(_ sender: Any) {
        guard let url = URL(string: self.asteroidReceived.nasaURL)else{
            print("invalid url")
            return
        }
        print(url)
        let safariVC = SFSafariViewController(url:url)
        present(safariVC, animated :true)
    }
    
    func listDidDisappear(){
        defaults.set(dropDown.selectedIndex, forKey: "selectedIndexAux")
        print(defaults.integer(forKey: "selectedIndexAux"))
        if UserDefaults.standard.string(forKey: "AppleLanguages") == "en"{
            
            if let mag = asteroidReceived.absolute_magnitude{
                magnitudeLabel.text = "Absolute Magnitude : \(mag)"
            }
            
            MissDistanceLabel.text = "Miss Distance : \(asteroidReceived.closeApproach[0].missDistance.astronomical) (Astronomical)"
            
            if let orbit = asteroidReceived.closeApproach[0].orbiting_body{
                orbitLabel.text = "Orbits Around : \(orbit)"
            }
            
        if(dropDown.selectedIndex == 0){
            defaults.set(0, forKey: "selectedIndexAux")
            if let di_min = asteroidReceived.diameters.min_diameter_m {
                if let di_max = asteroidReceived.diameters.max_diameter_m{
                    diameterLabel.text = "Diameter between \(di_min) and \(di_max) meters"
                }
            }
            //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_m) meters and \(asteroidReceived.diameters.max_diameter_m) meters"
            velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.kilometersPerSecond) km/hour"
        }else if(dropDown.selectedIndex == 1){
            if let di_min = asteroidReceived.diameters.min_diameter_f {
                if let di_max = asteroidReceived.diameters.max_diameter_f{
                    diameterLabel.text = "Diameter between \(di_min) and \(di_max) feet"
                }
            }
            
            //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_f) feet and \(asteroidReceived.diameters.max_diameter_f) feet"
            velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.milesPerHour) miles/hour"
        }else if(dropDown.selectedIndex == 2){
            if let di_min = asteroidReceived.diameters.min_diameter_f {
                if let di_max = asteroidReceived.diameters.max_diameter_f{
                    diameterLabel.text = "Diameter between \(di_min) and \(di_max) feet"
                }
            }
            
            //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_f) feet and \(asteroidReceived.diameters.max_diameter_f) feet"
            velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.kilometersPerSecond) km/hour"
        }else if(dropDown.selectedIndex == 3){
            if let di_min = asteroidReceived.diameters.min_diameter_m {
                if let di_max = asteroidReceived.diameters.max_diameter_m{
                    diameterLabel.text = "Diameter between \(di_min) and \(di_max) meters"
                }
            }
            
            //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_m) meters and \(asteroidReceived.diameters.max_diameter_f) meters"
            velocity.text = "Velocity : \(asteroidReceived.closeApproach[0].relativeVelocity.milesPerHour) miles/hour"
        }
        } else if UserDefaults.standard.string(forKey: "AppleLanguages") == nil{
            
            if let orbit = asteroidReceived.closeApproach[0].orbiting_body{
                orbitLabel.text = "Orbita à volta de : \(orbit)"
            }
            
            if let mag = asteroidReceived.absolute_magnitude{
                magnitudeLabel.text = "Magnitude Absoluta : \(mag)"
            }
            MissDistanceLabel.text = "Distancia mais próxima : \(asteroidReceived.closeApproach[0].missDistance.astronomical) (Astronomical)"
            
            if(dropDown.selectedIndex == 0){
                defaults.set(0, forKey: "selectedIndexAux")
                if let di_min = asteroidReceived.diameters.min_diameter_m {
                    if let di_max = asteroidReceived.diameters.max_diameter_m{
                        diameterLabel.text = "Diametro entre \(di_min) e \(di_max) metros"
                    }
                }
                //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_m) meters and \(asteroidReceived.diameters.max_diameter_m) meters"
                velocity.text = "Velocidade : \(asteroidReceived.closeApproach[0].relativeVelocity.kilometersPerSecond) km/hora"
            }else if(dropDown.selectedIndex == 1){
                if let di_min = asteroidReceived.diameters.min_diameter_f {
                    if let di_max = asteroidReceived.diameters.max_diameter_f{
                        diameterLabel.text = "Diametro entre \(di_min) e \(di_max) feet"
                    }
                }
                
                //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_f) feet and \(asteroidReceived.diameters.max_diameter_f) feet"
                velocity.text = "Velocidade: \(asteroidReceived.closeApproach[0].relativeVelocity.milesPerHour) milhas/hora"
            }else if(dropDown.selectedIndex == 2){
                if let di_min = asteroidReceived.diameters.min_diameter_f {
                    if let di_max = asteroidReceived.diameters.max_diameter_f{
                        diameterLabel.text = "Diametro entre \(di_min) e \(di_max) feet"
                    }
                }
                
                //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_f) feet and \(asteroidReceived.diameters.max_diameter_f) feet"
                velocity.text = "Velocidade : \(asteroidReceived.closeApproach[0].relativeVelocity.kilometersPerSecond) km/hora"
            }else if(dropDown.selectedIndex == 3){
                if let di_min = asteroidReceived.diameters.min_diameter_m {
                    if let di_max = asteroidReceived.diameters.max_diameter_m{
                        diameterLabel.text = "Diametro entre \(di_min) e \(di_max) metros"
                    }
                }
                
                //diameterLabel.text = "Diameter between \(asteroidReceived.diameters.min_diameter_m) meters and \(asteroidReceived.diameters.max_diameter_f) meters"
                velocity.text = "Velocidade: \(asteroidReceived.closeApproach[0].relativeVelocity.milesPerHour) milhas/hora"
            }
        }
    }
    
   
    
    

}

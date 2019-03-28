//
//  Asteroid.swift
//  NASADaily
//
//  Created by Simão Samouco on 26/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import Foundation
import SwiftyJSON

class Asteroid{
    var name: String!
    //var designation: String!
    var nasaURL: String!
    var absolute_magnitude: Float!
    var diameters: Diameters!
    var closeApproach: [CloseApproach] = []
    //var close_approach_date: String!
    
    //var auxArray: JSON!
    
    init(jsonReceived: JSON){
        self.name = jsonReceived["name"].stringValue
        //self.designation = jsonReceived[""]
        self.nasaURL = jsonReceived["nasa_jpl_url"].stringValue
        self.absolute_magnitude = jsonReceived["absolute_magnitude_h"].floatValue
        self.diameters = Diameters.init(jsonReceived: jsonReceived["estimated_diameter"])
        if let data = jsonReceived["close_approach_data"].array{
            for approach in data{
                closeApproach.append(CloseApproach.init(jsonReceived: approach))
            }
            //let x = data.map{item in CloseApproach.init(jsonReceived: item)}
        }
        //self.closeApproach = CloseApproach.init(jsonReceived: jsonReceived["close_approach_data"])+
    }
    
}

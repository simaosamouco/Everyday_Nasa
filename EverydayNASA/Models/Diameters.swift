//
//  Diameters.swift
//  NASADaily
//
//  Created by Simão Samouco on 27/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import Foundation
import SwiftyJSON

class Diameters{
    var max_diameter_m: Float!
    var min_diameter_m: Float!
    var max_diameter_f: Float!
    var min_diameter_f: Float!
    
    
    init(jsonReceived: JSON){
        var auxJsonMeters: JSON = jsonReceived["meters"]
        //self.auxJson = jsonReceived["meters"]
        self.max_diameter_m = auxJsonMeters["estimated_diameter_max"].floatValue
        self.min_diameter_m = auxJsonMeters["estimated_diameter_min"].floatValue
        
        var auxJsonFeet: JSON = jsonReceived["feet"]
        //self.auxJson = jsonReceived["meters"]
        self.max_diameter_f = auxJsonFeet["estimated_diameter_max"].floatValue
        self.min_diameter_f = auxJsonFeet["estimated_diameter_min"].floatValue
    }
    
}

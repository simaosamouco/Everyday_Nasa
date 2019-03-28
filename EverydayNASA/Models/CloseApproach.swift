//
//  CloseApproach.swift
//  NASADaily
//
//  Created by Simão Samouco on 27/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import Foundation
import SwiftyJSON

class CloseApproach{
    var close_approach_date: String!
    var orbiting_body: String!
    
    var relativeVelocity: (kilometersPerSecond: String, kilometersPerHour: String, milesPerHour: String)
    //var relative_velocity_sec: String!
    //var relative_velocity_hour: String!
    
    //var miss_distance_kil: String!
    //var miss_distance_lunar: String!
    
    var missDistance: MissDistance
    init(jsonReceived: JSON){
        print(jsonReceived)
        self.close_approach_date = jsonReceived["close_approach_date"].stringValue
        self.orbiting_body = jsonReceived["orbiting_body"].stringValue
        var auxJsonVelocity = jsonReceived["relative_velocity"]
       /* self.relative_velocity_sec = auxJsonVelocity["kilometers_per_second"].stringValue
        self.relative_velocity_hour = auxJsonVelocity["kilometers_per_hour"].stringValue*/
        relativeVelocity = (auxJsonVelocity["kilometers_per_second"].stringValue,auxJsonVelocity["kilometers_per_hour"].stringValue,auxJsonVelocity["miles_per_hour"].stringValue)
        
        missDistance = MissDistance(missDistanceJson: jsonReceived["miss_distance"])
        /*self.miss_distance_kil = auxJsonMissDistance["kilometers"].stringValue
        self.miss_distance_lunar = auxJsonMissDistance["lunar"].stringValue*/
        
    }
}
struct MissDistance{
    var astronomical: String
    var lunar: String
    var kilometers: String
    var miles: String
    
    init(missDistanceJson: JSON){
        self.astronomical = missDistanceJson["astronomical"].stringValue
        self.lunar = missDistanceJson["lunar"].stringValue
        self.kilometers = missDistanceJson["kilometers"].stringValue
        self.miles = missDistanceJson["miles"].stringValue
    }
}


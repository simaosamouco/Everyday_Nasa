//
//  AsteroidsResponse.swift
//  NASADaily
//
//  Created by Simão Samouco on 26/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import Foundation
import SwiftyJSON


class AsteroidsResonse{
    var nextPage: String!
    var prevPage: String!
    var results: [Asteroid] = []
    
    
    
    
    init(jsonRecebido: JSON){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.string(from: date)
        print(todayDate)
        
        var auxJson: JSON = jsonRecebido["near_earth_objects"]
        //self.auxJson = jsonRecebido["near_earth_objects"]
        
        var auxJsonLinks : JSON = jsonRecebido["links"]
        self.nextPage = auxJsonLinks["next"].stringValue
        self.prevPage = auxJsonLinks["prev"].stringValue
        
        for result in auxJson["\(todayDate)"].arrayValue {
            results.append(Asteroid.init(jsonReceived: result))
        }
    }
}

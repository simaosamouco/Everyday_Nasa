//
//  PictureOfTheDay.swift
//  NASADaily
//
//  Created by Simão Samouco on 25/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class PictureOfTheDay{
    
    var date: String!
    var explanation: String!
    var hdurl: String!
    var media_type: String!
    var service_version: String!
    var title: String!
    var url: String!
    
    init(JsonRecebido: JSON){
        self.date = JsonRecebido["date"].stringValue
        self.explanation = JsonRecebido["explanation"].stringValue
        self.hdurl = JsonRecebido["hdurl"].stringValue
        self.media_type = JsonRecebido["media_type"].stringValue
        self.service_version = JsonRecebido["service_version"].stringValue
        self.title = JsonRecebido["title"].string
        self.url = JsonRecebido["url"].stringValue
        
    }
}

//
//  ServiceHelper.swift
//  NASADaily
//
//  Created by Simão Samouco on 25/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiceHelper{
    
    static let shared = ServiceHelper()
    
    private var sessionManager: SessionManager
    
    init(){
        self.sessionManager = SessionManager()
    }
    
    func getPicOfTheDay(completinHandler: @escaping (_: PictureOfTheDay) -> Void){
        let url = "https://api.nasa.gov/planetary/apod?api_key=Dg5wb0QRUZnRWwZEgPXgYtmShta6I16Bm33AI8I0"
        self.sessionManager.request(url, method: .get, parameters: [:], headers: ["Accept":"application/json"]).responseString{
            response in
            if let resp = response.result.value
            {
                let novoJson = JSON(parseJSON: resp)
                
                let ch = PictureOfTheDay(JsonRecebido: novoJson)
                completinHandler(ch)
                //print(resp)
            }
        }
    }
    
    func getAsteroidsOfTheDay(completinHandler: @escaping (_: AsteroidsResonse) -> Void){
        let url = "https://www.neowsapp.com/rest/v1/feed/today"
        self.sessionManager.request(url, method: .get, parameters: [:], headers: ["Accept":"application/json"]).responseString{
            response in
            if let resp = response.result.value
            {
                let novoJson = JSON(parseJSON: resp)
                //print(novoJson)
                let ch = AsteroidsResonse(jsonRecebido: novoJson)
                completinHandler(ch)
                //print(resp)
            }
        }
    }
    /*
    func getAllCharacters(page: String = "1", completinHandler: @escaping (_: CharacterResponse) -> Void){
        let url = "https://rickandmortyapi.com/api/character/?page=\(page)"
        //let parameters: Parameters = ["page": page]
        self.sessionManager.request(url, method: .get, parameters: [:], headers: ["Accept":"application/json"]).responseString{
            response in
            if let resp = response.result.value
            {
                let novoJson = JSON(parseJSON: resp)
                
                let ch = CharacterResponse(jsonRecebido: novoJson)
                completinHandler(ch)
                //print(resp)
            }
        }
    }
 */
}




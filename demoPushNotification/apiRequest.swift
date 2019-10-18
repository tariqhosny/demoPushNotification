//
//  apiRequest.swift
//  demoPushNotification
//
//  Created by Tariq on 10/18/19.
//  Copyright © 2019 Tariq. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class apiRequest: NSObject {
    
    class func registerToken (token: String){
        
        let apiURL = "http://api.pushbots.com/2/subscriptions"
        
        let parametars = [
            "platform": "0",
            "token": "\(token)"
            ]
        let header = [
            "Content-Type": "application/x-www-form-urlencoded",
            "x-pushbots-appid": "5d258e58b7941208c73fcfb7"
        ]
        Alamofire.request(apiURL, method: .post, parameters: parametars, encoding: URLEncoding.httpBody, headers: header).responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                print(error)
                
            case .success(let value):
                let json = JSON(value)
                print(json)
            }
        }
    }
    
}

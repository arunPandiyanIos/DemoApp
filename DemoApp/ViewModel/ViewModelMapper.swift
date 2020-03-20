//
//  ViewModelMapper.swift
//  DemoApp
//
//  Created by XCEL MAC on 20/03/20.
//  Copyright © 2020 XCEL MAC. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class ViewMapper:BaseService {
    
    static let shared = ViewMapper()
    
    func getProfile(subAction: String, callback: @escaping (_ error: String?, _ user: User?) -> Void) {
        let request = buildRequest()
        
        self.request(request: request) { (error, data) in
            if let error = error {
                callback(error, nil)
                return
            }
            let result = data[""]
            let user = Mapper<User>().map(JSONObject: result.object)
            callback(nil, user)
        }
        
    }
}

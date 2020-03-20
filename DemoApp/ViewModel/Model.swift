//
//  Model.swift
//  DemoApp
//
//  Created by XCEL MAC on 20/03/20.
//  Copyright © 2020 XCEL MAC. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable, Codable {
  
    
    var userId: String?
       var imageUrl: String?
    
    init?(map: Map) {
          
      }
      
      mutating func mapping(map: Map) {
          userId <- map[""]
          imageUrl <- map[""]
      }
}

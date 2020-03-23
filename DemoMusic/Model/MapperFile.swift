//
//  MapperFile.swift
//  DemoMusic
//


import ObjectMapper

struct AppleMusicAndApp: Mappable, Codable {
    
    var feed: AppleMusicFeed?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        feed <- map["feed"]
    }
}

struct AppleMusicFeed: Mappable, Codable {
    
    var result: [AppleMusicFeedResult]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        result <- map["results"]
    }
}

struct AppleMusicFeedResult: Mappable, Codable {
    
    var id: String?
    var name: String?
    var artistName: String?
    var imageUrl: String?
    var date: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        artistName <- map["artistName"]
        imageUrl <- map["artworkUrl100"]
        date <- map["releaseDate"]
    }
}

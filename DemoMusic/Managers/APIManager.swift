//
//  APIManager.swift
//  DemoMusic


import SwiftyJSON

class APIManager: BaseService {
    
    static let shared = APIManager()
    
    func getAppMusic(callback: @escaping (_ error: String?, _ data: JSON?) -> Void) {
        let request = buildRequest(url: "https://rss.itunes.apple.com/api/v1/in/apple-music/coming-soon/all/100/explicit.json")
        
        self.request(request: request) { (error, data) in
            if let error = error {
                callback(error, nil)
                return
            }
            print(data)
            callback(nil, data)
        }
    }
    
    func getiOSApps(callback: @escaping (_ error: String?, _ data: JSON?) -> Void) {
        let request = buildRequest(url: "https://rss.itunes.apple.com/api/v1/in/ios-apps/new-apps-we-love/all/50/explicit.json")
        self.request(request: request) { (error, data) in
            if let error = error {
                callback(error, nil)
                return
            }
            print(data)
            callback(nil, data)
        }
    }
    
    func getAudioBook(callback: @escaping (_ error: String?, _ data: JSON?) -> Void) {
        let request = buildRequest(url: "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/10/explicit.json")
        self.request(request: request) { (error, data) in
            if let error = error {
                callback(error, nil)
                return
            }
            print(data)
            callback(nil, data)
        }
    }
    
}

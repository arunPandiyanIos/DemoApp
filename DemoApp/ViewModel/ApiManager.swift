//
//  ApiManager.swift
//  DemoApp
//
//  Created by XCEL MAC on 20/03/20.
//  Copyright © 2020 XCEL MAC. All rights reserved.
//

import Foundation


class BaseService {
    
//    func request(request: URLRequestConvertible, method: HTTPMethod = .post, callback: @escaping(_ error: String?, _ data: JSON) -> Void) {
//
//        Alamofire.request(request).validate().responseJSON { (response) in
//            switch response.result {
//            case .success(let value):
//                guard let valueDictionary = value as? [String: Any] else {
//                    callback("Unknown error. Please try again", [])
//                    return
//                }
//
//                if let status = valueDictionary[FieldNames.xscstatus] as? Int, status == -1 {
//                    if let error = valueDictionary[FieldNames.message] as? String {
//                        callback(error, [])
//                        return
//                    }
//                }
//                print("result fetched successfull")
//                callback(nil, JSON(value))
//            case .failure(let error):
//                callback(error.localizedDescription, [])
//            }
//        }
//    }
}





//func iosAppCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
//       let cell = tableView.dequeueReusableCell(withIdentifier: "AppleMusicTableViewCell", for: indexPath) as! AppleMusicTableViewCell
//       return cell
//   }
//
//   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//       if collectionView == appleMusicList {
//          return 2
//       }
//           return 2
//      }
//
//      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       if collectionView == appleMusicList {
//      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleMusicCollectionViewCell", for: indexPath) as! AppleMusicCollectionViewCell
//       return cell
//       }else {
//           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IosAppCollectionViewCell", for: indexPath) as! IosAppCollectionViewCell
//           return cell
//       }
//      }

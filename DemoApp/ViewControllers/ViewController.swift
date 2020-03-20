//
//  ViewController.swift
//  DemoApp
//
//  Created by XCEL MAC on 19/03/20.
//  Copyright © 2020 XCEL MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        return 15
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
        if section == 2 {
            return sectionCell.contentView
        }else {
            return sectionCell.contentView
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return appleMusicCell(tableView: tableView, indexPath: indexPath)
            } else if indexPath.row == 1 {
                return iosAppCell(tableView: tableView, indexPath: indexPath)
            }
        }
        return audioBooksCell(tableView: tableView, indexPath: indexPath)
    }
    
    func appleMusicCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppleMusicTableViewCell", for: indexPath) as! AppleMusicTableViewCell
        cell.appleMusicList.delegate = self as? UICollectionViewDelegate
        cell.appleMusicList.dataSource = self as? UICollectionViewDataSource
               cell.appleMusicList.tag = indexPath.row
               cell.appleMusicList.reloadData()
        return cell
    }
    func iosAppCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "IosAppTableViewCell", for: indexPath) as! IosAppTableViewCell
           cell.iosAppsList.delegate = self as? UICollectionViewDelegate
           cell.iosAppsList.dataSource = self as? UICollectionViewDataSource
                  cell.iosAppsList.tag = indexPath.row
                  cell.iosAppsList.reloadData()
           return cell
       }
   func audioBooksCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "AudioBooksTableViewCell", for: indexPath) as! AudioBooksTableViewCell
       return cell
   }
   
       
}


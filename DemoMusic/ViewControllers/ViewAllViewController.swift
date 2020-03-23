//
//  ViewAllViewController.swift
//  DemoMusic


import UIKit

class ViewAllViewController: UIViewController {

    
    @IBOutlet weak var viewAllTableView: UITableView!
    var appMusics: AppleMusicAndApp?
    var iOSApps: AppleMusicAndApp?
    var pageType:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewAllTableView.reloadData()
    }
}

extension ViewAllViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if pageType == "iOSApps" {
             return iOSApps?.feed?.result?.count ?? 0
        }
        return appMusics?.feed?.result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewAllCell(tableView: tableView, indexPath: indexPath)
    }
    
    func viewAllCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AudioBooksTableViewCell", for: indexPath) as! AudioBooksTableViewCell
        if pageType == "iOSApps" {
        cell.setUpCell(audioBooks: iOSApps?.feed?.result?[indexPath.row])
    }else {
    cell.setUpCell(audioBooks: appMusics?.feed?.result?[indexPath.row])
    }
        return cell
    }
}

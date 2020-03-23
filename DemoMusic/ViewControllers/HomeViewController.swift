//
//  HomeViewController.swift
//  DemoMusic


import UIKit
import ObjectMapper

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var homeTableView: UITableView!
    var appMusics: AppleMusicAndApp? {
        didSet {
            homeTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        }
    }
    var iOSApps: AppleMusicAndApp? {
        didSet {
            homeTableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .none)
        }
    }
    var audioBooks: AppleMusicAndApp? {
        didSet {
            homeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAppMusic()
        getiOSApp()
        getAudioBooks()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (audioBooks?.feed?.result?.count ?? 0) + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return appleMusicCell(tableView: tableView, indexPath: indexPath)
        } else if indexPath.row == 1 {
            return iosAppCell(tableView: tableView, indexPath: indexPath)
        }
        return audioBooksCell(tableView: tableView, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                 let Page = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
                          Page.audioBooks = audioBooks?.feed?.result?[indexPath.row]
                                 self.present(Page, animated: true, completion: nil)
    }
   
    func appleMusicCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppleMusicTableViewCell", for: indexPath) as! AppleMusicTableViewCell
        cell.appleMusicList.delegate = self
        cell.appleMusicList.dataSource = self
        cell.appleMusicList.tag = indexPath.row
        cell.appleMusicList.reloadData()
        cell.buttonClicks = { [weak self] (data) in
                   if data == "appMusics" {
                       self?.openViewAllAppMusicPage()
                   }
               }
        return cell
    }
    func iosAppCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IosAppsTableViewCell", for: indexPath) as! IosAppsTableViewCell
        cell.iosAppsList.delegate = self
        cell.iosAppsList.dataSource = self
        cell.iosAppsList.tag = indexPath.row
        cell.iosAppsList.reloadData()
        cell.buttonClicks = { [weak self] (data) in
            if data == "iOSApps" {
                self?.openViewAllIosAppsPage()
            }
        }
        return cell
    }
    func audioBooksCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AudioBooksTableViewCell", for: indexPath) as! AudioBooksTableViewCell
        cell.setUpCell(audioBooks: audioBooks?.feed?.result?[indexPath.row - 2])
        cell.titleText.isHidden = !(indexPath.row == 2)
        return cell
    }
    
    func openViewAllAppMusicPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Page = storyboard.instantiateViewController(withIdentifier: "ViewAllViewController") as! ViewAllViewController
        Page.appMusics = appMusics
        Page.pageType = "appMusics"
        self.present(Page, animated: true, completion: nil)
       }
    func openViewAllIosAppsPage() {
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
     let Page = storyboard.instantiateViewController(withIdentifier: "ViewAllViewController") as! ViewAllViewController
     Page.iOSApps = iOSApps
     Page.pageType = "iOSApps"
     self.present(Page, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppMusicCollectionViewCell", for: indexPath) as! AppMusicCollectionViewCell
            cell.setUpCell(audioBooks: appMusics?.feed?.result?[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iOSAppCollectionViewCell", for: indexPath) as! iOSAppCollectionViewCell
            cell.setUpCell(audioBooks: iOSApps?.feed?.result?[indexPath.row])
            return cell
        }
        
    }
    
    
}

extension HomeViewController {
    func getAppMusic() {
        APIManager.shared.getAppMusic { (error, data) in
            if error != nil {
                self.showAlert(title: "Opps", message: error ?? "Something went wrong")
                return
            }
            self.appMusics = Mapper<AppleMusicAndApp>().map(JSONObject: data?.object)
        }
    }
    
    func getiOSApp() {
        APIManager.shared.getiOSApps { (error, data) in
            if error != nil {
                self.showAlert(title: "Opps", message: error ?? "Something went wrong")
                return
            }
            self.iOSApps = Mapper<AppleMusicAndApp>().map(JSONObject: data?.object)
        }
    }
    
    func getAudioBooks() {
        APIManager.shared.getAudioBook { (error, data) in
            if error != nil {
                self.showAlert(title: "Opps", message: error ?? "Something went wrong")
                return
            }
            self.audioBooks = Mapper<AppleMusicAndApp>().map(JSONObject: data?.object)
        }
    }
}

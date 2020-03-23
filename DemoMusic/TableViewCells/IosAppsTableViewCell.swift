//
//  IosAppsTableViewCell.swift
//  DemoMusic


import UIKit

class IosAppsTableViewCell: UITableViewCell {
 @IBOutlet weak var iosAppsList: UICollectionView!
     var buttonClicks : ((_ data: String?) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func viewAllButtonClick(_ sender: Any) {
           buttonClicks?("iOSApps")
       }
    

}

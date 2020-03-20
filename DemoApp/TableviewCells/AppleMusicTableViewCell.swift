//
//  AppleMusicTableViewCell.swift
//  DemoApp
//
//  Created by XCEL MAC on 19/03/20.
//  Copyright © 2020 XCEL MAC. All rights reserved.
//

import UIKit

class AppleMusicTableViewCell: UITableViewCell {

    @IBOutlet weak var appleMusicList: UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  iOSAppCollectionViewCell.swift
//  DemoMusic


import UIKit

class iOSAppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    func setUpCell(audioBooks: AppleMusicFeedResult?) {
        name.text = audioBooks?.name
        detail.text = audioBooks?.artistName
        imageView.sd_setImage(with: URL(string: audioBooks?.imageUrl ?? ""), placeholderImage:nil)
    }
    

    
}

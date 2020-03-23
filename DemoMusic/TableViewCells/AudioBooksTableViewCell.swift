//
//  AudioBooksTableViewCell.swift
//  DemoMusic


import UIKit
import SDWebImage

class AudioBooksTableViewCell: UITableViewCell {

    @IBOutlet weak var AudioImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var titleText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(audioBooks: AppleMusicFeedResult?) {
        name.text = audioBooks?.name
        detail.text = audioBooks?.artistName
        AudioImageView.sd_setImage(with: URL(string: audioBooks?.imageUrl ?? ""), placeholderImage:nil)
    }
}

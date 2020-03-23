//
//  DetailsViewController.swift
//  DemoMusic
//


import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    
    var audioBooks: AppleMusicFeedResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = audioBooks?.name ?? ""
        artistName.text = audioBooks?.artistName ?? ""
        date.text = audioBooks?.date ?? ""
        imageView.sd_setImage(with: URL(string: audioBooks?.imageUrl ?? ""), placeholderImage:nil)
    }

}

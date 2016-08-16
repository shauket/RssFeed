//
//  SongCell.swift
//  INSPOWER
//
//  Created by Shauket Sheikh on 16/08/2016.
//  Copyright © 2016 Shauket Sheikh. All rights reserved.
//

import UIKit
import BTLabel
import Alamofire
class SongCell: UITableViewCell {

    @IBOutlet var cellImage: UIImageView!

    @IBOutlet var titleName: BTLabel!

    @IBOutlet var titleDetail: UILabel!
    @IBOutlet var playNowBtn: UIButton!
    @IBOutlet var imageWidthContraint: NSLayoutConstraint!
    
    @IBOutlet var grayColorView: UIView!
    
    @IBOutlet var parentView: UIView!
    
    @IBOutlet var itemView: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCellWithData(data: RSSItem, indexPath:NSIndexPath) {
//        cellImage.image = UIImage(named: ((data as! String) + ".jpg"))
        titleName.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        titleName.numberOfLines = 0
        titleName.verticalAlignment = BTVerticalAlignment.Bottom
        titleName.textAlignment = NSTextAlignment.Center
        
        titleDetail.numberOfLines = 0
        titleDetail.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.titleName.text = data.title
        titleDetail.text = data.itemDescription
//        titleDetail.textAlignment = NSTextAlignment.Cente
        let placeholderImage = UIImage(named: "user_gray_icon")!

        cellImage.image = placeholderImage
        
        
       // cellImage.af_setImageWithURL(url, placeholderImage: placeholderImage)
        titleDetail.sizeToFit()

    }
}

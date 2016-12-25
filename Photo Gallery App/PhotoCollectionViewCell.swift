//
//  PhotoCollectionViewCell.swift
//  Photo Gallery App
//
//  Created by Quoc Anh Tran on 12/25/16.
//  Copyright © 2016 Anh Tran. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 19
        imageView.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1.0).cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.zPosition = 1
        closeButton.isHidden = true
        closeButton.layer.zPosition = 3
        overlayView.layer.zPosition = 2
        overlayView.layer.cornerRadius = 19
    }
}

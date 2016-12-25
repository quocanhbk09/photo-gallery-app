//
//  AddPhotoCollectionViewCell.swift
//  Photo Gallery App
//
//  Created by Quoc Anh Tran on 12/25/16.
//  Copyright © 2016 Anh Tran. All rights reserved.
//

import UIKit

class AddPhotoCollectionViewCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 19
        self.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
    }
}

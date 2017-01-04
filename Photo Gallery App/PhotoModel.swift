//
//  PhotoModel.swift
//  Photo Gallery App
//
//  Created by Quoc Anh Tran on 1/3/17.
//  Copyright © 2017 Anh Tran. All rights reserved.
//

import Foundation
import UIKit

class PhotoModel {
    var photo: UIImage
    var isSelected: Bool
    
    init(_ photo: UIImage){
        self.photo = photo
        self.isSelected = false
    }
}

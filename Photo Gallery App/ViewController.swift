//
//  ViewController.swift
//  Photo Gallery App
//
//  Created by Quoc Anh Tran on 12/22/16.
//  Copyright © 2016 Anh Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    let photos = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row < self.photos.count){
            let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
            return cell
        } else {
            let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "AddCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row < self.photos.count){
            let selectedCell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
            let isSelected = !selectedCell.closeButton!.isHidden
            selectedCell.closeButton!.isHidden = isSelected
            selectedCell.overlayView!.isHidden = isSelected
        } else {
            let selectPhotoAlert = UIAlertController(title: "Choose your photo", message: nil, preferredStyle: .actionSheet)
            selectPhotoAlert.addAction(UIAlertAction(title: "Choose photo from gallery", style: .default, handler: nil))
            selectPhotoAlert.addAction(UIAlertAction(title: "Camera", style: .default, handler: nil))
            
            selectPhotoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(selectPhotoAlert, animated: true)
        }
    }
    
}


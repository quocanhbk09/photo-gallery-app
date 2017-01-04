//
//  ViewController.swift
//  Photo Gallery App
//
//  Created by Quoc Anh Tran on 12/22/16.
//  Copyright © 2016 Anh Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photos : [PhotoModel] = []
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let photoCellNib = UINib(nibName: "PhotoCollectionCell", bundle: nil)
        photoCollectionView.register(photoCellNib, forCellWithReuseIdentifier: "PhotoCell")
        let addPhotoCellNib = UINib(nibName: "AddPhotoCollectionCell", bundle: nil)
        photoCollectionView.register(addPhotoCellNib, forCellWithReuseIdentifier: "AddCell")
        imagePicker.delegate = self
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
            let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
            let photo = photos[indexPath.row]
            
            cell.removeButton!.isHidden = !photo.isSelected
            cell.overlayView!.isHidden = !photo.isSelected
            cell.imageView.image = photo.photo
            cell.doRemovePhoto = { (_ sender: UIButton) in
                print("remove photo")
                var indexCell: IndexPath!
                if let superview = sender.superview {
                    if let cell = superview.superview as? PhotoCollectionViewCell {
                        indexCell = self.photoCollectionView.indexPath(for: cell)
                        self.photos.remove(at: indexCell.row)
                    }
                }
            }
            return cell
        } else {
            let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "AddCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row < self.photos.count){
            let selectedCell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
            var photo = photos[indexPath.row]
            photo.isSelected = !photo.isSelected
            let isSelected = photo.isSelected
            
            selectedCell.removeButton!.isHidden = !isSelected
            selectedCell.overlayView!.isHidden = !isSelected
        } else {
            let selectPhotoAlert = UIAlertController(title: "Choose your photo", message: nil, preferredStyle: .actionSheet)
            selectPhotoAlert.addAction(UIAlertAction(title: "Choose photo from gallery", style: .default, handler: doLoadPhotoFromGallery))
            selectPhotoAlert.addAction(UIAlertAction(title: "Camera", style: .default, handler: doLoadPhotoFromGallery))
            
            selectPhotoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(selectPhotoAlert, animated: true)
        }
    }
    
    func doLoadPhotoFromGallery(action: UIAlertAction){
        imagePicker.allowsEditing = false
        if action.title == "Camera" {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let photo = PhotoModel(pickedImage)
            photos.append(photo)
            photoCollectionView.reloadData()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}


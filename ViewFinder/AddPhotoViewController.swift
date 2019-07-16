//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Ellen McMillan. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var imagePicker = UIImagePickerController()

    @IBOutlet weak var btncaptionText: UITextField!
    
    @IBOutlet weak var newImageView: UIImageView!
    
    @IBAction func btnSavePhoto(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let photoSave = Photos(entity: Photos.entity(), insertInto: context)
            
            photoSave.caption = btncaptionText.text
            
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                let photoSave = Photos(entity: Photos.entity(), insertInto: context)
                
                photoSave.caption = btncaptionText.text
                
                if let userImage = newImageView.image {
                    
                    if let userImageData = userImage.pngData() {
                        photoSave.photo = userImageData
                    }
                }
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            navigationController?.popViewController(animated: true)
        }
    
    }
    @IBAction func btnCamera(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func btnLibrary(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func btnAlbum(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var newImage: UIImageView!
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage =
            info[UIImagePickerController.InfoKey.originalImage]
                as? UIImage{ newImage.image = selectedImage}
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    
    }
    */

}

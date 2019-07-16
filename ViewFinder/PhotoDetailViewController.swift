//
//  PhotoDetailViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Ellen McMillan. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

   
    @IBOutlet weak var imageView: UIImageView!
    var photo : Photos? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let realPhoto = photo {
            title = realPhoto.caption
            if let cellPhotoImageData = realPhoto.photo {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    imageView.image = cellPhotoImage
                }
            
        }
    
        }
    
    

    /*
    // MARK: - Navigation

    
    */

}
}

//
//  PhotoHelper.swift
//  Savvy
//
//  Created by Elmer Astudillo on 8/5/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import UIKit

class PhotoHelper: NSObject {
    
    // MARK: - Properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Helper Methods
    
    func presentActionSheet(from viewController: UIViewController) -> UIAlertController
    {
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        
        //Checking whether ios device/simular has a camera
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
                //Calling method to present the appropriate source type based on user selection
                self.presentImagePickerController(with: .camera, from: viewController)
            })
            
            alertController.addAction(capturePhotoAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
                self.presentImagePickerController(with: .photoLibrary, from: viewController)
            })
            
            alertController.addAction(uploadAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        
        return alertController
        //Present UIAlertController from our UIViewController. Remember we must pass in a reference from the view controller presenting the alert controller for this method to properly present the UIAlertController
//        viewController.present(alertController, animated: true)
//        present(alertController, animated: true, completion: nil)
//        presentViewController(alertController, animated: true, completion: nil)
//        self.present(popoverPresentationController, animated: true, completion: nil)
    }
    
    //Present ImagePickerController
    func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType, from viewController: UIViewController)
    {
        //Create a new instance of UIImagePickerController. This object will present a native UI compenent that will allow the user to take a photo from the cameraor choose an image from the library
        let imagePickerController = UIImagePickerController()
        //Source type to determine whether to active camera or display photo library. Source type is specified by the argument passed into the function
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        
        //After our imagePickerControlelr is initialized and configured, we present the view controller
        viewController.present(imagePickerController, animated: true)
    }
}

//Now that our class is the delate we are responsible for dismissing the UIImagePickerController
extension PhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            // if image was returned we pass it to our completionHandler property
            completionHandler?(selectedImage)
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

//
//  CameraViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 9/19/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit
import MobileCoreServices

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageorvideo: Int = 0
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   // take picture from phone
    @IBAction func takephoto(_ sender: Any) {
        imageorvideo = 1
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true,completion: nil)
            
        }
    }
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if(imageorvideo == 1){
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImage.contentMode = .scaleToFill
            myImage.image = pickedImage
        
        }
        picker.dismiss(animated: true, completion: nil)
        }else if(imageorvideo == 0){
            let tempImage = info[UIImagePickerControllerMediaURL] as! NSURL!
            let pathString = tempImage?.relativePath
            self.dismiss(animated: true, completion: {})
    
            UISaveVideoAtPathToSavedPhotosAlbum(pathString!, self, nil, nil)
            
        }
    }
    
    @IBAction func takeVideo(_ sender: Any) {
        
        imageorvideo = 1
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            imagePicker.showsCameraControls = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    
    
    //save photo 
    @IBAction func savePhoto(_ sender: Any) {
        
        let imageData = UIImagePNGRepresentation(myImage.image!)
        let compressedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "saved", message: "Your Image Has been Saved", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    

}

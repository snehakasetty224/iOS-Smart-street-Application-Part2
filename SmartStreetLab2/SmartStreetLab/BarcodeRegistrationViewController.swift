//
//  BarcodeRegistrationViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 10/25/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit
import AVFoundation

class BarcodeRegistrationViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var square: UIImageView!
    var video = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //creating session
        let session = AVCaptureSession()
        
        //define capture device
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do{
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        }
        catch{
            print("ERROR")
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubview(toFront: square)
        
        session.startRunning()
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObjectTypeQRCode
                {
//                                      let alert = UIAlertController(title: "OR Code", message: object.stringValue, preferredStyle: .alert)
//                                        alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
//                                        alert.addAction(UIAlertAction(title: "copy", style: .default, handler: {(nil)in UIPasteboard.general.string = object.stringValue}))
//
//                                        present(alert, animated: true, completion: nil)
                    
                    var message = object.stringValue
                    var lines: [String] = []
                    message?.enumerateLines { line, _ in
                        lines.append(line)
                    }
                    var username = lines[0]
                    var email = lines[1]
                    var password = lines[2]
                    
                    // store Data
                    let defaults:UserDefaults = UserDefaults.standard
                    defaults.set(email, forKey: "userEmail")
                    defaults.set(password, forKey: "password")
                    UserDefaults.standard.synchronize()
                    
                    //displaying alert message with
                    var myalert = UIAlertController(title: "alert", message: "Registration is successfull", preferredStyle: UIAlertControllerStyle.alert);
                    let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default){ action in self.dismiss(animated: true, completion: nil);
                        
                    }
                    myalert.addAction(okAction);
                    self.present(myalert, animated:true, completion:nil);
                    
                    
                    //UIApplication.shared.open(NSURL(string:object.stringValue)! as URL, options: [:], completionHandler: nil)
                    
                    
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}


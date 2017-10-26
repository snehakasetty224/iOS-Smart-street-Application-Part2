//
//  AudioRecorderViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 10/24/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit
import AVFoundation

class AudioRecorderViewController: UIViewController, AVAudioRecorderDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var recordingSession: AVAudioSession!
    var audioRecorder:AVAudioRecorder!
    var audioPlayer:AVAudioPlayer!
    
    var path = URL(string: "https://www.google.com")
    
    var numberOfRecords:Int = 0
    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self

        // Do any additional setup after loading the view.
        recordingSession = AVAudioSession.sharedInstance()
        
        if let number:Int = UserDefaults.standard.object(forKey: "MyNumber")as?Int
        {
            numberOfRecords = number
        }
        
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in
            if hasPermission
            {
               print("accepted")
                
            }
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordButton(_ sender: Any) {
        
        // Checking if we have an active recorder
        if audioRecorder == nil
        {
            numberOfRecords += 1
            let filename = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey:1200, AVNumberOfChannelsKey: 1,AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue ]
            
            //start Audio Recording
            
            do{
                audioRecorder = try AVAudioRecorder(url: filename, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                recordingLabel.text = "Stop Recording"
            }
            catch{
                
                displayAlert(title: "opps!", message: "Recording failed")
            }
            
        }else{
            audioRecorder.stop()
            audioRecorder = nil
            UserDefaults.standard.set(numberOfRecords, forKey: "myNumber")
            myTableView.reloadData()
            recordingLabel.text = "Start Recording"
        }
        
        
    }
    
    //function to get path to directory
    
    func getDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    // function display alert
    func displayAlert(title: String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
    }
    
    // Setting Up Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRecords
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        path  = getDirectory().appendingPathComponent("\(indexPath.row + 1).m4a")
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: path!)
            audioPlayer.play()
            print(path)
            print("Audio is Playing")
           
        }
        catch
        {
            print("cannot Play Audio")
        }
    }
    
    @IBAction func shareMusic(_ sender: Any) {
        
        print(path!)
        print("path")
        
        let activityVC = UIActivityViewController(activityItems: [self.path!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    
  

}

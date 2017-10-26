//
//  NearbyLocationViewController.swift
//  SmartStreetLab
//
//  Created by Sneha Kasetty Sudarshan on 9/20/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

import UIKit
import MapKit

class NearbyLocationViewController: UIViewController {
    // location for SJSU 
    
    @IBAction func showSJSU(_ sender: Any) {
        
        let latitude:CLLocationDegrees = 37.335392
        let longitude:CLLocationDegrees = -121.881071
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "San Jose State University"
        mapItem.openInMaps(launchOptions: options)
        
        
    }
    // location for mission college
    
    @IBAction func showMissionCollege(_ sender: Any) {
        let latitude:CLLocationDegrees = 37.391677
        let longitude:CLLocationDegrees = -121.982020
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Mission College"
        mapItem.openInMaps(launchOptions: options)
        
    }
    
     // location for Martin Luther library
    @IBAction func showMartinLutherLibrary(_ sender: Any) {
        
        let latitude:CLLocationDegrees = 37.335557
        let longitude:CLLocationDegrees = -121.884525
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Dr. Martin Luther King Library"
        mapItem.openInMaps(launchOptions: options)
        
        
    }
    
      // location for santa clara univeristy
    
    @IBAction func showSantaClaraUniversity(_ sender: Any) {
        
        let latitude:CLLocationDegrees = 37.351974
        let longitude:CLLocationDegrees = -121.939119
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Santa Clara University"
        mapItem.openInMaps(launchOptions: options)
    }
    
    // location for mission college
    @IBAction func showMissionCollegeLibrary(_ sender: Any) {
        
        let latitude:CLLocationDegrees = 37.391973
        let longitude:CLLocationDegrees = -121.980581
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Mission College Library"
        mapItem.openInMaps(launchOptions: options)
    }
    
    //location for santa clara library
    @IBAction func showSantaClaraLibrary(_ sender: Any) {
        
        let latitude:CLLocationDegrees = 37.348225
        let longitude:CLLocationDegrees = -121.937512
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Santa Clara Library"
        mapItem.openInMaps(launchOptions: options)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

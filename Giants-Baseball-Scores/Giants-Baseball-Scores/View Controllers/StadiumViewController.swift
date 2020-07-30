//
//  StadiumViewController.swift
//  Giants-Baseball-Scores
//
//  Created by Enzo Jimenez-Soto on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit
import MapKit

class StadiumViewController: UIViewController {
    
    //MARK: - Properties
    let stadiumCor = AllStadiums()
    let gameViewController = GameViewController()

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Mapping each stadium
    
    // Giants
    func openMapForGiants() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(37.778473, -122.389595)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Oracle Park Stadium"
        mapItem.openInMaps(launchOptions: options)
    }
    
    // Dodgers
    func openMapForDodgers() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(34.072724, -118.240646)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Dodger Stadium"
        mapItem.openInMaps(launchOptions: options)
    }
    
    // Rockies
    func openMapForRockies() {
      let regionDistance:CLLocationDistance = 500
      let coordinates = CLLocationCoordinate2DMake(39.7559, 104.9942)
      let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
      let options = [
        MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
        MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
      ]
      let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = "Coors Field"
      mapItem.openInMaps(launchOptions: options)
    }
    
    
}

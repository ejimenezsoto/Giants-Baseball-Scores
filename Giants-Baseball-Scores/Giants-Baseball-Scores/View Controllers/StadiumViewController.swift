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
    
    let stadiumCor = AllStadiums()
    
    var stadiumButtonTitle: String?

    let gameViewController = GameViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if stadiumButtonTitle == "Oracle Park Stadium" {
            openMapForGiants()
        }
        if stadiumButtonTitle == "Dodger Stadium" {
            openMapForDodgers()
        }
        if stadiumButtonTitle == "PETCO Park" {
           openMapForPadres()
        }
        if stadiumButtonTitle == "Globe Life Field" {
            openMapForRangers()
        }
        if stadiumButtonTitle == "Coors Field" {
        openMapForRockies()
        }
        if stadiumButtonTitle == "Minute Maid Park" {
         openMapForAstros()
        }
        if stadiumButtonTitle == "Oakland Coliseum" {
         openMapForAthletic()
        }
        if stadiumButtonTitle == "Angel Stadium of Anaheim" {
         openMapForAngels()
        }
        if stadiumButtonTitle == "Chase Field" {
         openMapForDiamondbacks()
        }
        if stadiumButtonTitle == "T-Mobile Park" {
         openMapForMariners()
        }
        
        
       

        
    
    }

    
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
    func openMapForPadres() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(32.707710, -117.157097)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "PETCO Park"
        mapItem.openInMaps(launchOptions: options)
    }
    func openMapForRangers() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(32.747361, -97.084167)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Globe Life Field"
        mapItem.openInMaps(launchOptions: options)
    }
    func openMapForRockies() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(39.755891, -104.994198)
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
    
    func openMapForAstros() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(29.756965, -95.354824)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Minute Maid Park"
        mapItem.openInMaps(launchOptions: options)
    }
    func openMapForAthletic() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(37.751605, -122.200523)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Oakland Coliseum"
        mapItem.openInMaps(launchOptions: options)
    }
    func openMapForAngels() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(33.799925, -117.883194)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Angel Stadium of Anaheim"
        mapItem.openInMaps(launchOptions: options)
    }
    func openMapForDiamondbacks() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(33.445526, -112.066721)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Chase Field"
        mapItem.openInMaps(launchOptions: options)
    }
    func openMapForMariners() {
        
        let regionDistance:CLLocationDistance = 500
        let coordinates = CLLocationCoordinate2DMake(47.591358, -122.332283)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "T-Mobile Park"
        mapItem.openInMaps(launchOptions: options)
    }
}

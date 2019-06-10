//
//  CoffeeShop.swift
//  Drip-V1
//
//  Created by Joey Park on 11/28/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//

import UIKit
import MapKit
public class CoffeeShop {
    var mapitem : MKMapItem
    var pointAnnotation : MKPointAnnotation
    var hours = (9,5)
    init(start: Int, end: Int, shop:MKMapItem) {
        self.mapitem = shop
        self.pointAnnotation = MKPointAnnotation.init()
        self.pointAnnotation.coordinate = shop.placemark.coordinate
        self.pointAnnotation.title = shop.name
        self.hours = (start, end)
    }
    init(name: String, phonenumber: String, start: Int, end: Int, latitudeCoordinate:Double, longitudeCoordinate:Double){
        let coordinates = CLLocationCoordinate2D.init(latitude: latitudeCoordinate, longitude: longitudeCoordinate)
        let temp_placemark = MKPlacemark.init(coordinate : coordinates)
        let temp_mapitem = MKMapItem.init(placemark: temp_placemark)
        temp_mapitem.name = name
        temp_mapitem.phoneNumber = phonenumber
        self.mapitem = temp_mapitem
        self.hours = (start, end)
        self.pointAnnotation = MKPointAnnotation.init()
        self.pointAnnotation.coordinate = coordinates
        self.pointAnnotation.title = name
    }
}

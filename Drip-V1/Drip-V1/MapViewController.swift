//
//  MapViewController.swift
//  Drip-V1
//
//  Created by William Pintas on 11/9/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    
    var listOfShops: NSArray = []
    

  
    var locValue : CLLocationCoordinate2D? = nil

    @IBOutlet weak var goNext: UIButton!
    
    @IBOutlet weak var mapView : MKMapView!
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius: Double = 1000
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locValue = manager.location!.coordinate
        self.centerMapOnUserLocation()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        goNext.isEnabled = false
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
        locationManager.startUpdatingLocation()
      
        
        
        let thinkCoffee = CoffeeShop.init(name: "Think Coffee", phonenumber: "2122286226", start: 7, end: 10, latitudeCoordinate: 40.728338, longitudeCoordinate: -73.995286)
        let thirdRailCoffee = CoffeeShop.init(name: "Third Rail Coffee", phonenumber: "6465801240", start: 7, end: 8, latitudeCoordinate: 40.7300017, longitudeCoordinate: -73.9988431)
        let listOfShops = [thinkCoffee, thirdRailCoffee]
        
        for shops in listOfShops{
            mapView.addAnnotation(shops.pointAnnotation)
        }
        
        
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let thinkCoffee = CoffeeShop.init(name: "Think Coffee", phonenumber: "2122286226", start: 7, end: 10, latitudeCoordinate: 40.728338, longitudeCoordinate: -73.995286)
        let thirdRailCoffee = CoffeeShop.init(name: "Third Rail Coffee", phonenumber: "6465801240", start: 7, end: 8, latitudeCoordinate: 40.7300017, longitudeCoordinate: -73.9988431)
        let listOfShops = [thinkCoffee, thirdRailCoffee]
        
        for shops in listOfShops{
            mapView.addAnnotation(shops.pointAnnotation)
        }
        
        if let annotation = view.annotation as? MKPointAnnotation {
            for shop in listOfShops{
                if (shop.mapitem.name == annotation.title){
                    let order = Order.getInstance()
                    order.selectedShop = shop
                    goNext.isEnabled = true
                }
            }
        }
    }
    func centerMapOnUserLocation() {
        let coordinateRegion = MKCoordinateRegion(center: locValue!, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
   
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


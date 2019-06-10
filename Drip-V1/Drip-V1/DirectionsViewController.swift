import UIKit
import MapKit
class DirectionsViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    var locationManager = CLLocationManager()
    var locValue : CLLocationCoordinate2D? = nil
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius: Double = 1000
    @IBOutlet weak var navigationMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationMapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
        locationManager.startUpdatingLocation()
        navigationMapView.showsUserLocation = true
        let order = Order.getInstance()
        let request = MKDirections.Request()
        let currentLocation = locationManager.location?.coordinate
        navigationMapView.addAnnotation((order.selectedShop?.pointAnnotation)!)
        request.transportType = .walking
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: currentLocation!))
        request.destination = order.selectedShop?.mapitem
        request.requestsAlternateRoutes = true
       
        
        
        let directions = MKDirections(request: request)
        
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
            for route in unwrappedResponse.routes {
                self.navigationMapView.addOverlay(route.polyline)
                self.navigationMapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                let rect = route.polyline.boundingMapRect
                let newrect = MKMapRect(x: rect.origin.x - rect.width/1.5, y: rect.origin.y - rect.height/3, width: rect.width + rect.width, height: rect.height + (rect.height)/2)
            
               var region = MKCoordinateRegion(newrect)
                
                self.navigationMapView.setRegion(region, animated: true)
            }
        }
        
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        return renderer
    }
    
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else {return}
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        navigationMapView.setRegion(coordinateRegion, animated: true)
    }
    
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locValue = manager.location!.coordinate
        self.centerMapOnUserLocation()
        
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


//
//  locationViewController.swift
//  Werewolves
//
//  Created by User09 on 2020/1/2.
//  Copyright © 2020 Claudio. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import SafariServices

class locationViewController: UIViewController , CLLocationManagerDelegate,
MKMapViewDelegate{
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestLocation()
        mapView.delegate = self
         mapView.register(MKMarkerAnnotationView.self,
        forAnnotationViewWithReuseIdentifier: "annotation")
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
         let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = "Restaurants"
                request.region = MKCoordinateRegion(center: locations[0].coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                let search = MKLocalSearch(request: request)
                 search.start { (response, error) in
                 response?.mapItems.forEach({ (item) in
                 let annotation = LinkAnnotation(coordinate:
                item.placemark.coordinate, title: item.name, subtitle:
                item.placemark.title, url: item.url)
                 self.mapView.addAnnotation(annotation)
                 })
                 self.mapView.setRegion(request.region, animated: true)
                 }
        
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)
//    -> MKAnnotationView? {
//        if annotation is MKPointAnnotation {
//            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation",for: annotation)
//            annotationView.canShowCallout = true
//            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//            return annotationView
//        }
//        return nil
//     }
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//     let annotation = view.annotation as? MKPointAnnotation
//     print(annotation)
//
//    }
    
    
    //
    class LinkAnnotation: NSObject, MKAnnotation {
     internal init(coordinate: CLLocationCoordinate2D, title:
    String?, subtitle: String?, url: URL?) {
     self.coordinate = coordinate
     self.title = title
     self.subtitle = subtitle
     self.url = url
     }

     var coordinate: CLLocationCoordinate2D
     var title: String?
     var subtitle: String?
     var url: URL?

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation:
    MKAnnotation) -> MKAnnotationView? {
     if annotation is LinkAnnotation {
     let annotationView =
    mapView.dequeueReusableAnnotationView(withIdentifier: "annotation",
    for: annotation)
     annotationView.canShowCallout = true
     annotationView.rightCalloutAccessoryView =
    UIButton(type: .detailDisclosure)
     return annotationView
     }
     return nil
     }
    
    func mapView(_ mapView: MKMapView, annotationView view:
    MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
     if let annotation = view.annotation as? LinkAnnotation, let
    url = annotation.url {
     let controller = SFSafariViewController(url: url)
     present(controller, animated: true, completion: nil)
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

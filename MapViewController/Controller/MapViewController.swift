//
//  MapViewController.swift
//  Rently Application
//
//  Created by Archana Venugopal on 19/02/22.


import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var myMap: MKMapView!


var myRoute : MKRoute!

    override func viewDidLoad() {
        super.viewDidLoad()

        let point1 = MKPointAnnotation()
        let point2 = MKPointAnnotation()
        let point3 = MKPointAnnotation()
        let point4 = MKPointAnnotation()

        point1.coordinate = CLLocationCoordinate2DMake(9.909332674647834, 76.27258300781251)
        point1.title = "Kochi"
        myMap.addAnnotation(point1)

        point2.coordinate = CLLocationCoordinate2DMake(11.0018115, 76.9628425)
        point2.title = "Coimbatore"
        myMap.addAnnotation(point2)
        myMap.centerCoordinate = point2.coordinate
    
        point3.coordinate = CLLocationCoordinate2DMake(9.9261153, 78.1140983)
        point3.title = "Madurai"
        myMap.addAnnotation(point3)
        myMap.centerCoordinate = point3.coordinate
    
        point4.coordinate = CLLocationCoordinate2DMake(10.0869959, 77.0600915)
        point4.title = "Munnar"
        myMap.addAnnotation(point4)
        myMap.centerCoordinate = point4.coordinate
        myMap.delegate = self

        myMap.setRegion(MKCoordinateRegion(center: point2.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7,longitudeDelta: 0.7)), animated: true)

        let directionsRequest = MKDirections.Request()

        let markKochi = MKPlacemark(coordinate: CLLocationCoordinate2DMake(point1.coordinate.latitude, point1.coordinate.longitude), addressDictionary: nil)
        let markCoimbatore = MKPlacemark(coordinate: CLLocationCoordinate2DMake(point2.coordinate.latitude, point2.coordinate.longitude), addressDictionary: nil)
        let markMadurai = MKPlacemark(coordinate: CLLocationCoordinate2DMake(point3.coordinate.latitude, point3.coordinate.longitude), addressDictionary: nil)
        let markMunnar = MKPlacemark(coordinate: CLLocationCoordinate2DMake(point4.coordinate.latitude, point4.coordinate.longitude), addressDictionary: nil)

        let routeArray = [markKochi, markCoimbatore, markMadurai, markMunnar, markKochi]
        for i in 0...routeArray.count - 2 {
            directionsRequest.source = MKMapItem(placemark: routeArray[i])
            directionsRequest.destination = MKMapItem(placemark: routeArray[i+1])
            directionsRequest.transportType = MKDirectionsTransportType.automobile
            let directions = MKDirections(request: directionsRequest)

            directions.calculate(completionHandler: {
                response, error in
                if error == nil {
                    self.myRoute = response!.routes[0] as MKRoute
                    self.myMap.addOverlay(self.myRoute.polyline)
                }
            })
        }
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) ->MKOverlayRenderer {
        let myLineRenderer = MKPolylineRenderer(polyline: myRoute.polyline)
        myLineRenderer.strokeColor = UIColor.red
        myLineRenderer.lineWidth = 3
        return myLineRenderer
    }
}

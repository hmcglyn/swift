//
//  ViewController.swift
//  TravelBook
//
//  Created by Hakan Çağlayan on 20.12.2022.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager  = CLLocationManager()
    
    @IBOutlet weak var mpView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mpView.delegate=self
        locationManager.delegate=self
        
        //lokasyon bilgisinin keskinliği
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        //kullanıcı lokasyon izni
        locationManager.requestWhenInUseAuthorization()
        
        //lokasyon bilgisi alınmaya başlanıyor
        locationManager.startUpdatingLocation()
        
        
        //gesture
        let gesture=UILongPressGestureRecognizer(target: self, action: #selector(ChooseLocation(gestureRecognizer:)))
        //basılı tutma süresi
        gesture.minimumPressDuration=2
        mpView.addGestureRecognizer(gesture)
    }
    
    @objc func ChooseLocation(gestureRecognizer: UILongPressGestureRecognizer)
    {
        if(gestureRecognizer.state == .began)
        {
            //dokunan noktayı alma
            let touchedPoint=gestureRecognizer.location(in: self.mpView)
            
            //koordinatlara convert etme
            let touchedCoordinates=self.mpView.convert(touchedPoint, toCoordinateFrom: self.mpView)
            //pin oluşturma
            let annotation=MKPointAnnotation()
            annotation.coordinate=touchedCoordinates
            annotation.title="New Annotation"
            annotation.subtitle="Travel Book"
            mpView.addAnnotation(annotation )
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //kullanıcı konumu
        let location=CLLocationCoordinate2D(latitude: locations.first!.coordinate.latitude, longitude: locations.first!.coordinate.longitude)
        
        //zoom seviyesi
        let span=MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region=MKCoordinateRegion(center: location, span: span)
        mpView.setRegion(region, animated: true)
    }
}


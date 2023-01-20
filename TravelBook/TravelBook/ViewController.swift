//
//  ViewController.swift
//  TravelBook
//
//  Created by Hakan Çağlayan on 20.12.2022.
//

import UIKit
import MapKit
import CoreLocation
import CoreData


class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {
    var chosenLatitude = Double()
    var chosenLongitude=Double()
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtNote: UITextField!
    var locationManager  = CLLocationManager()
    
    @IBAction func btnSave(_ sender: Any) {
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace=NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(txtName.text, forKey: "title")
        newPlace.setValue(txtNote.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey:"latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do
        {
            try context.save()
            print("success")
        } catch{
            print("error")
        }
        
    }
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
            
            chosenLatitude=touchedCoordinates.latitude
            chosenLongitude=touchedCoordinates.longitude
            //pin oluşturma
            let annotation=MKPointAnnotation()
            annotation.coordinate=touchedCoordinates
            annotation.title=txtName.text
            annotation.subtitle=txtNote.text
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


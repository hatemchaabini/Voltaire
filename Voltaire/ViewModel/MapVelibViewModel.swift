//
//  MapVelibViewModel.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//

import SwiftUI
import Alamofire
import MapKit
class MapVelibViewModel : NSObject, ObservableObject,CLLocationManagerDelegate {
    @Published var records = [Records]()

    @Published var showLocationList : Bool = false
    var ancp : Double = 1
    
        @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.delegate = self

    }
    func updateLocation() {
           locationManager.requestLocation()
       }
       
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
             
             DispatchQueue.main.async {
                 self.region = MKCoordinateRegion(
                     center: location.coordinate
                     , span: MapDetails.zoomSpan
                 )
             }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)  {

        checkLocationAuthorization()

    }

    func requestAllowOnceLocationPermission()  {
   locationManager.requestLocation()
        if(locationManager.location?.coordinate.latitude != nil && locationManager.location?.coordinate.latitude != ancp){
            ancp = (locationManager.location?.coordinate.latitude)!
            
            self.getRecords()
        }



    }
    
    
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager.delegate = self
        }
        else {
            print("Veuillez activer votre localisation")
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager as CLLocationManager? else { return }


            switch locationManager.authorizationStatus{
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("votre emplacement est restreint probablement en raison des contrôles parentaux")
            case .denied:
                print("vous avez refusé l'autorisation de localisation de cette application ? allez dans les paramètres pour le modifier")
            case .authorizedAlways, .authorizedWhenInUse:
                
                region = MKCoordinateRegion(center:  CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 48.8580933, longitude:locationManager.location?.coordinate.longitude ?? 2.3449456 ), span: MapDetails.defaultSpan)

             self.getRecords()
             ancp = (self.locationManager.location?.coordinate.latitude)!

            @unknown default:
                break

            }

    }

    func showNextLocation(record : Fields){
        withAnimation(.easeIn){
            region = MKCoordinateRegion(center:  CLLocationCoordinate2D(latitude: record.coordonnees_geo!.first!, longitude:record.coordonnees_geo!.last! ),
                                        span: MapDetails.zoomSpanIn)
            showLocationList = false
        }
        
    }

     func toggleLocaionList(){
        withAnimation(.easeInOut){
            showLocationList = !showLocationList
        }
    }


    func getRecords()   {
        if(locationManager.location?.coordinate.latitude != nil ){
            AF.request("https://opendata.paris.fr/api/records/1.0/search/?dataset=velib-disponibilite-en-temps-reel&q=&facet=name&facet=is_installed&facet=is_renting&facet=is_returning&facet=nom_arrondissement_communes&geofilter.distance=\((self.locationManager.location?.coordinate.latitude)!)%2C\((locationManager.location?.coordinate.longitude)!)%2C1000")
          .validate()
          .responseDecodable(of: Velibs.self) { (response) in
            guard let Velibs = response.value else { return }
              self.records = Velibs.records!
          }}
        }
    }

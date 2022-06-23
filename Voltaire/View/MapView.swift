//
//  MapView.swift
//  SwiftUIAlamofire
//
//  Created by Hatem Chaabini on 20/06/2022.
//  Copyright © 2022 iowncode. All rights reserved.
//

import MapKit
import SwiftUI
import CoreLocationUI
struct MapView : View {
    
    @ObservedObject var observed = MapVelibViewModel()
    
    var body: some View{
        
        ZStack(alignment: .bottom){
     
                
            Map(coordinateRegion: $observed.region, showsUserLocation: true,annotationItems: observed.records,
                annotationContent: { i in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: i.fields!.coordonnees_geo!.first!, longitude: i.fields!.coordonnees_geo!.last!)){
                    
                    if (i.fields!.ebike! > 0){
                        LocationMapAnnotationView(nb : i.fields!.ebike!, ebike: true)
                    }
                    if (i.fields!.mechanical! > 0){
                        LocationMapAnnotationView(nb : i.fields!.mechanical!, ebike: false)
                    }
                    
                }
                
                
            })
            .ignoresSafeArea()
            .accentColor(Color(.systemGreen))
            .onAppear{
                observed.checkIfLocationServicesIsEnabled()
                
                
                
                
                
            }
           
            VStack {
                        HStack {
                            Spacer()
                            
                            LocationButton(.currentLocation){
                                
                                observed.requestAllowOnceLocationPermission()
                                
                                
                            }
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .labelStyle(.iconOnly)
                            .symbolVariant(.fill)
                            .tint(.green)
                                    .padding(10)
                            
                        }
                        .padding(.top, 5)
                        Spacer()
                    }
            
            VStack{
                Button(action : observed.toggleLocaionList){
                    Text("Afficher les station")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom,10)
                        .padding(.top,10)
                        .overlay(alignment: .leading){
                            Image(systemName: "arrow.up")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding()
                                .rotationEffect(Angle(degrees: observed.showLocationList ? 180 : 0))
                        }
                }
                
                if observed.showLocationList{
                    VelibLocationListView(observed: observed)
                }
            }.background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 15)
            
            
            
        }
        
    }
}

struct MapView_Previews: PreviewProvider{
    static var previews: some View{
        MapView()
    }
}

struct SubscriptionView: View {
    
    var title: String
    var price: String
    var fontColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack {
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .foregroundColor(fontColor)
                .fontWeight(.black)
            
            Text("$\(price)")
                .font(.system(.title, design: .rounded))
                .foregroundColor(fontColor)
            
            Text("per month")
                .font(.headline)
                .foregroundColor(fontColor)
            
        } //VStack
        .frame(maxWidth: .infinity, minHeight: 150)
        .padding(30)
        .background(bgColor)
        .cornerRadius(20)
    }
    
}

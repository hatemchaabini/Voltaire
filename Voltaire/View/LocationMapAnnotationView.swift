//
//  LocationMapAnnotationView.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//


import SwiftUI


struct ImageOverlay: View {
    var nb : Int
    var body: some View {
        ZStack {
            Text("\(nb)")
                .font(.callout)
                .foregroundColor(.black)
        }
        .cornerRadius(10.0)
        
        .padding(-25)
    }
}

struct LocationMapAnnotationView: View {
    var nb : Int
    var ebike : Bool
    var body: some View {
        VStack(spacing : 0){
            if (ebike) {

            Image(systemName: "bicycle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.cyan)
                .cornerRadius(36)
                .overlay(ImageOverlay(nb:nb), alignment: .bottomTrailing)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.cyan)
                .frame(width: 15, height: 15)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
            }
            if (!ebike){Image(systemName: "bicycle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.green)
                .cornerRadius(36)
                .overlay(ImageOverlay(nb:nb), alignment: .bottomTrailing)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.green)
                .frame(width: 15, height: 15)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
//                .padding(.bottom,40)
            }
            
        }

    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView(nb : 3,ebike: true)
        }
    }
}

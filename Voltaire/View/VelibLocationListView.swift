//
//  VelibLocationListView.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//

import SwiftUI


struct VelibLocationListView : View {
    @ObservedObject var observed : MapVelibViewModel
//   var observed : [Records]
    var body : some View{
        List {
            ForEach(observed.records) { i in
                Button{
                    observed.showNextLocation(record: i.fields!)
                }label: {
                    listRowView(i: i)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                
            }
        }.listStyle(PlainListStyle())
    }
}



extension VelibLocationListView {
    private func listRowView(i: Records) -> some View{
        VStack(alignment: .leading){
            Text(i.fields!.nom_arrondissement_communes!)
                .font(.headline)
            Text(i.fields!.name!)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

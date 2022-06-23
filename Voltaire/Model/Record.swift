////
////  Record.swift
////  Voltaire
////
////  Created by Hatem Chaabini on 22/06/2022.
////
//
//class Fields : Codable {
//    var name : String?
//    var stationcode : String?
//    var ebike : Int?
//    var mechanical : Int?
//    var coordonnees_geo : [Double]?
//    var duedate : String?
//    var numbikesavailable : Int?
//    var numdocksavailable : Int?
//    var capacity : Int?
//    var is_renting : String?
//    var is_installed : String?
//    var nom_arrondissement_communes : String?
//    var is_returning : String?
//    var dist : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case name = "name"
//        case stationcode = "stationcode"
//        case ebike = "ebike"
//        case mechanical = "mechanical"
//        case coordonnees_geo = "coordonnees_geo"
//        case duedate = "duedate"
//        case numbikesavailable = "numbikesavailable"
//        case numdocksavailable = "numdocksavailable"
//        case capacity = "capacity"
//        case is_renting = "is_renting"
//        case is_installed = "is_installed"
//        case nom_arrondissement_communes = "nom_arrondissement_communes"
//        case is_returning = "is_returning"
//        case dist = "dist"
//    }
//    init(      name : String?
//               , stationcode : String?
//               , ebike : Int?
//               , mechanical : Int?
//               , coordonnees_geo : [Double]?
//               , duedate : String?
//               , numbikesavailable : Int?
//               , numdocksavailable : Int?
//               , capacity : Int?
//               , is_renting : String?
//               , is_installed : String?
//               , nom_arrondissement_communes : String?
//               , is_returning : String?
//               , dist : String?) {
//        self.name = name
//        self.stationcode = stationcode
//        self.ebike = ebike
//        self.mechanical = mechanical
//        self.coordonnees_geo = coordonnees_geo
//        self.duedate = duedate
//        self.numbikesavailable = numbikesavailable
//        self.numdocksavailable = numdocksavailable
//        self.capacity = capacity
//        self.is_renting = is_renting
//        self.is_installed = is_installed
//        self.nom_arrondissement_communes = nom_arrondissement_communes
//        self.is_returning = is_returning
//        self.dist = dist
//    }
//
//}
//
//
//class Geometry : Codable {
//    var type : String?
//    var coordinates : [Double]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case type = "type"
//        case coordinates = "coordinates"
//    }
//
//    init( type : String?,
//          coordinates : [Double]?){
//        self.type = type
//        self.coordinates = coordinates
//    }
//
//}
//
//struct Records : Codable {
//
//    var datasetid : String?
//    var recordid : String?
//    var fields : Fields?
//    var geometry : Geometry?
//    var record_timestamp : String?
//    
// 
//    
//    
//    
//}

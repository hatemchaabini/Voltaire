//
//  Fields.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//

import Foundation
struct Fields : Codable {
	let name : String?
	let stationcode : String?
	let ebike : Int?
	let mechanical : Int?
	let coordonnees_geo : [Double]?
	let duedate : String?
	let numbikesavailable : Int?
	let numdocksavailable : Int?
	let capacity : Int?
	let is_renting : String?
	let is_installed : String?
	let nom_arrondissement_communes : String?
	let is_returning : String?
	let dist : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case stationcode = "stationcode"
		case ebike = "ebike"
		case mechanical = "mechanical"
		case coordonnees_geo = "coordonnees_geo"
		case duedate = "duedate"
		case numbikesavailable = "numbikesavailable"
		case numdocksavailable = "numdocksavailable"
		case capacity = "capacity"
		case is_renting = "is_renting"
		case is_installed = "is_installed"
		case nom_arrondissement_communes = "nom_arrondissement_communes"
		case is_returning = "is_returning"
		case dist = "dist"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		stationcode = try values.decodeIfPresent(String.self, forKey: .stationcode)
		ebike = try values.decodeIfPresent(Int.self, forKey: .ebike)
		mechanical = try values.decodeIfPresent(Int.self, forKey: .mechanical)
		coordonnees_geo = try values.decodeIfPresent([Double].self, forKey: .coordonnees_geo)
		duedate = try values.decodeIfPresent(String.self, forKey: .duedate)
		numbikesavailable = try values.decodeIfPresent(Int.self, forKey: .numbikesavailable)
		numdocksavailable = try values.decodeIfPresent(Int.self, forKey: .numdocksavailable)
		capacity = try values.decodeIfPresent(Int.self, forKey: .capacity)
		is_renting = try values.decodeIfPresent(String.self, forKey: .is_renting)
		is_installed = try values.decodeIfPresent(String.self, forKey: .is_installed)
		nom_arrondissement_communes = try values.decodeIfPresent(String.self, forKey: .nom_arrondissement_communes)
		is_returning = try values.decodeIfPresent(String.self, forKey: .is_returning)
		dist = try values.decodeIfPresent(String.self, forKey: .dist)
	}

}

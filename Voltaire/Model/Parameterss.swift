//
//  Parameterss.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//


import Foundation
struct Parameterss : Codable {
	let dataset : String?
	let rows : Int?
	let start : Int?
	let facet : [String]?
	let format : String?
	let geofilterdistance : [String]?
	let timezone : String?

	enum CodingKeys: String, CodingKey {

		case dataset = "dataset"
		case rows = "rows"
		case start = "start"
		case facet = "facet"
		case format = "format"
		case geofilterdistance = "geofilter.distance"
		case timezone = "timezone"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dataset = try values.decodeIfPresent(String.self, forKey: .dataset)
		rows = try values.decodeIfPresent(Int.self, forKey: .rows)
		start = try values.decodeIfPresent(Int.self, forKey: .start)
		facet = try values.decodeIfPresent([String].self, forKey: .facet)
		format = try values.decodeIfPresent(String.self, forKey: .format)
		geofilterdistance = try values.decodeIfPresent([String].self, forKey: .geofilterdistance)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
	}

}

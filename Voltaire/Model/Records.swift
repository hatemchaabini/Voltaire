//
//  Records.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//


import Foundation
struct Records : Codable,Identifiable {
	let datasetid : String?
	let id : String?
	let fields : Fields?
	let geometry : Geometry?
	let record_timestamp : String?

	enum CodingKeys: String, CodingKey {

		case datasetid = "datasetid"
		case id = "recordid"
		case fields = "fields"
		case geometry = "geometry"
		case record_timestamp = "record_timestamp"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		datasetid = try values.decodeIfPresent(String.self, forKey: .datasetid)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		fields = try values.decodeIfPresent(Fields.self, forKey: .fields)
		geometry = try values.decodeIfPresent(Geometry.self, forKey: .geometry)
		record_timestamp = try values.decodeIfPresent(String.self, forKey: .record_timestamp)
	}

}

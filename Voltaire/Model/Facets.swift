//
//  Facets.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//

import Foundation
struct Facets : Codable {
	let name : String?
	let count : Int?
	let state : String?
	let path : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case count = "count"
		case state = "state"
		case path = "path"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		path = try values.decodeIfPresent(String.self, forKey: .path)
	}

}

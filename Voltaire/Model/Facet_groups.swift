//
//  Facet_groups.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//


import Foundation
struct Facet_groups : Codable {
	let name : String?
	let facets : [Facets]?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case facets = "facets"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		facets = try values.decodeIfPresent([Facets].self, forKey: .facets)
	}

}

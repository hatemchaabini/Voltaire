//
//  Velibs.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//


import Foundation
struct Velibs : Codable {
    var nhits : Int?
    var parameters : Parameterss?
    var records : [Records]?
    var facet_groups : [Facet_groups]?

	enum CodingKeys: String, CodingKey {

		case nhits = "nhits"
		case parameters = "parameters"
		case records = "records"
		case facet_groups = "facet_groups"
	}

	init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
		nhits = try values.decodeIfPresent(Int.self, forKey: .nhits)
		parameters = try values.decodeIfPresent(Parameterss.self, forKey: .parameters)
		records = try values.decodeIfPresent([Records].self, forKey: .records)
		facet_groups = try values.decodeIfPresent([Facet_groups].self, forKey: .facet_groups)
	}

}

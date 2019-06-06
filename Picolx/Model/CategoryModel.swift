//
//	CategoryModel.swift
//
//	Create by Apple on 1/6/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct CategoryModel: Codable {

	let hits: [Hit]?
	let total: Int?
	let totalHits: Int?


	enum CodingKeys: String, CodingKey {
		case hits = "hits"
		case total = "total"
		case totalHits = "totalHits"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		hits = try values.decodeIfPresent([Hit].self, forKey: .hits)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		totalHits = try values.decodeIfPresent(Int.self, forKey: .totalHits)
	}


}

//
//	Hit.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/1/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//
import Foundation

struct Hit: Codable {

	let comments: Int?
	let downloads: Int?
	let favorites: Int?
	let id: Int?
	let imageHeight: Int?
	let imageSize: Int?
	let imageWidth: Int?
	let largeImageURL: String?
	let likes: Int?
	let pageURL: String?
	let previewHeight: Int?
	let previewURL: String?
	let previewWidth: Int?
	let tags: String?
	let type: String?
	let user: String?
	let userImageURL: String?
	let userId: Int?
	let views: Int?
	let webformatHeight: Int?
	let webformatURL: String?
	let webformatWidth: Int?

	enum CodingKeys: String, CodingKey {
		case comments = "comments"
		case downloads = "downloads"
		case favorites = "favorites"
		case id = "id"
		case imageHeight = "imageHeight"
		case imageSize = "imageSize"
		case imageWidth = "imageWidth"
		case largeImageURL = "largeImageURL"
		case likes = "likes"
		case pageURL = "pageURL"
		case previewHeight = "previewHeight"
		case previewURL = "previewURL"
		case previewWidth = "previewWidth"
		case tags = "tags"
		case type = "type"
		case user = "user"
		case userImageURL = "userImageURL"
		case userId = "user_id"
		case views = "views"
		case webformatHeight = "webformatHeight"
		case webformatURL = "webformatURL"
		case webformatWidth = "webformatWidth"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		comments = try values.decodeIfPresent(Int.self, forKey: .comments)
		downloads = try values.decodeIfPresent(Int.self, forKey: .downloads)
		favorites = try values.decodeIfPresent(Int.self, forKey: .favorites)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		imageHeight = try values.decodeIfPresent(Int.self, forKey: .imageHeight)
		imageSize = try values.decodeIfPresent(Int.self, forKey: .imageSize)
		imageWidth = try values.decodeIfPresent(Int.self, forKey: .imageWidth)
		largeImageURL = try values.decodeIfPresent(String.self, forKey: .largeImageURL)
		likes = try values.decodeIfPresent(Int.self, forKey: .likes)
		pageURL = try values.decodeIfPresent(String.self, forKey: .pageURL)
		previewHeight = try values.decodeIfPresent(Int.self, forKey: .previewHeight)
		previewURL = try values.decodeIfPresent(String.self, forKey: .previewURL)
		previewWidth = try values.decodeIfPresent(Int.self, forKey: .previewWidth)
		tags = try values.decodeIfPresent(String.self, forKey: .tags)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		user = try values.decodeIfPresent(String.self, forKey: .user)
		userImageURL = try values.decodeIfPresent(String.self, forKey: .userImageURL)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		views = try values.decodeIfPresent(Int.self, forKey: .views)
		webformatHeight = try values.decodeIfPresent(Int.self, forKey: .webformatHeight)
		webformatURL = try values.decodeIfPresent(String.self, forKey: .webformatURL)
		webformatWidth = try values.decodeIfPresent(Int.self, forKey: .webformatWidth)
	}


}

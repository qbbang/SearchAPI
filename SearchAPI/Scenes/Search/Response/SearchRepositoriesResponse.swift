//
//  SearchRepositoriesResponse.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import Foundation

struct SearchRepositoriesResponse: Codable {
    var totalCount: Int?
    var incompleteResults: Bool?
    var items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    var fullName: String?
    var description: String?
    var updatedAt: String?
    var stargazersCount: Int?
    var language: String?
    var license: License?
    var htmlurl: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case description
        case updatedAt = "updated_at"
        case stargazersCount = "stargazers_count"
        case language
        case license
        case htmlurl = "html_url"
    }
}

// MARK: - License
struct License: Codable {
    var spdxId: String?

    enum CodingKeys: String, CodingKey {
        case spdxId = "spdx_id"
    }
}

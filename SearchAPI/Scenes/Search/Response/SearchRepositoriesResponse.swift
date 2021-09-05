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
        case totalCount
        case incompleteResults
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    var fullName: String?                // 이름
    var description: String?            // 설명
    var updatedAt: String?              // 마지막 업데이트 한달까지는 표시하는거 같은 그 후는 날짜 표기 updated_at": "2021-09-05T14:17:34Z",
    var stargazersCount: Int?           // 별갯수
    var language: String?               // 언어
    var license: License?               // 라이센스 "\(spdx_id) license"
    var htmlurl: String?                // 상세페이지
    
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

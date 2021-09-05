//
//  GitHubAPI.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import Moya

enum GitHubAPI {
    case searchRepositories
}

extension GitHubAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .searchRepositories:
            return "/search/repositories"
        }
    }
    
    var method: Method {
        switch self {
        case .searchRepositories:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .searchRepositories:
            return .requestParameters(
                parameters: [
                    "q": "q",
                    // "sort": "",         /* 기본값  best match */
                    "order": "desc",     /* 기본값 desc, asc*/
                    "per_page": 30,     /* 기본값 30 */
                    "page": 1           /* 기본값 1 */
                ],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .searchRepositories:
            return [ "Accept": "application/vnd.github.v3+json"]
        }
    }
}

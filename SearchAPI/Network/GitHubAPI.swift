//
//  GitHubAPI.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import Moya

enum GitHubAPI {
    case searchRepositories(String, String, Int, Int)
}

extension GitHubAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("초기화 되지 않음")
        }
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
        case .searchRepositories(let text, let sort, let perPage, let page):
            return .requestParameters(
                parameters: [
                    "q": text,
                    // "sort": "",          /* 기본값  best match */
                    "order": sort,          /* 기본값 desc, asc*/
                    "per_page": perPage,    /* 기본값 30 */
                    "page": page            /* 기본값 1,  total / 30 -> 페이지갯수 */
                ],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .searchRepositories:
            return [
                // TODO: 시간당 요청한도 늘리기 토큰 필요한대 -> 필요하면 RemotoConfig로 적용할 것
//                 "Authorization": "token ...",
                "Accept": "application/vnd.github.v3+json"
            ]
        }
    }
}

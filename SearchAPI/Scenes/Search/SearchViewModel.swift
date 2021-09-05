//
//  SearchViewModel.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

class SearchViewModel {
    let provider = MoyaProvider<GitHubAPI>()
    var disposeBag = DisposeBag()
    
    var items = BehaviorSubject<[Item]>(value: [])
    
    deinit {
        disposeBag = DisposeBag()
    }
    
    func request(text: String, sort: SortType = .desc, perPage: Int = 30, page: Int = 1 ) {
        provider.rx
            .request(
                .searchRepositories(
                    text,
                    sort.rawValue,
                    perPage,
                    page
                )
            )
            .map(SearchRepositoriesResponse.self)
            .subscribe { [weak self] event in
                guard let this = self else { return }
                switch event {
                case .success(let res):
                    print("✅ res\n", res)
                    guard let items = res.items else { return }
                    this.items.onNext(items)
                case .failure(let err):
                    print("❌ err\n", err.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
    }
}


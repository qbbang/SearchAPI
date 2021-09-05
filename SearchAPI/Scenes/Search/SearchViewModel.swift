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
    
    let items = BehaviorSubject<[Item]>(value: [])
    let isLoading = BehaviorRelay<Bool>(value: false)
    var total = 0
    var itemCnt = 0
    
    deinit {
        disposeBag = DisposeBag()
    }
    
    func request(text: String, sort: SortType = .desc, perPage: Int = 30) {
        let maxPage = Int(ceil(Double(total) / Double(perPage)))
        let currentPage = Int(ceil(Double(itemCnt) / Double(perPage)))
        
        if total != 0, currentPage == maxPage {
            return
        }
        
        isLoading.accept(true)
        let page = itemCnt / perPage + 1
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
                this.isLoading.accept(false)
                
                switch event {
                case .success(let res):
                    guard let items = res.items else { return }
                    this.total = res.totalCount ?? 0
                    this.itemCnt += items.count
                    do {
                        try this.items.onNext(this.items.value() + items)
                    } catch {
                        fatalError()
                    }
                case .failure(let err):
                    print("❌ err\n", err.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
    }
}


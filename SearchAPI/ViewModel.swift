//
//  ViewModel.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import Moya
import RxSwift

class ViewModel {
    let provider = MoyaProvider<GitHubAPI>()
    let disposeBag = DisposeBag()
    
    func request() {
        provider.rx
            .request(.searchRepositories)
            .map(SearchRepositoriesResponse.self)
            .subscribe { event in
                switch event {
                case .success(let res):
                    print("✅ res\n", res)
                case .failure(let err):
                    print("❌ err\n", err.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
    }
}

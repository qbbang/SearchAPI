//
//  SearchViewController.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import UIKit

class SearchViewController: BaseViewController<SearchViewModel>, Bindable {
    func bind() {
        viewModel = SearchViewModel()
        
        // FIXME: 테스트
        viewModel.request(text: "qbbang")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
}

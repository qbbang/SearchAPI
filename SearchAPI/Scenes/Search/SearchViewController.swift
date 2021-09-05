//
//  SearchViewController.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import UIKit
import RxCocoa

class SearchViewController: BaseViewController<SearchViewModel>, Bindable {
    func bind() {
        viewModel = SearchViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            print("x버튼 또는 삭제")
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        viewModel.request(text: text)
    }
}

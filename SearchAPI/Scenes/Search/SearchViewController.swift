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
        
        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: "SearchResultTableViewCell", cellType: SearchResultTableViewCell.self)) { (_, element, cell) in
                cell.bind(model: element)
            }
            .disposed(by: disposeBag)
    }
    
    func setUI() {
        tableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel.items.onNext([])
        }
    }
    
    // MARK: 시간당 호출 제한으로 검색을 눌렀을 때만 API를 호출
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        viewModel.request(text: text)
    }
}

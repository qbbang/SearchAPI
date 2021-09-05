//
//  SearchViewController.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import UIKit
import RxCocoa

class SearchViewController: BaseViewController<SearchViewModel>, Bindable {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
    
    func bind() {
        viewModel = SearchViewModel()
        
        viewModel.isLoading
            .subscribe(onNext: { [weak self] isLoading in
                guard let this = self else { return }
                
                if isLoading {
                    this.activityIndicator.startAnimating()
                } else {
                    this.activityIndicator.stopAnimating()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: "SearchResultTableViewCell", cellType: SearchResultTableViewCell.self)) { (_, element, cell) in
                cell.bind(model: element)
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .willDisplayCell
            .subscribe { [weak self] event in
                guard let this = self else { return }
                if let row = event.element?.indexPath.row, (row + 1) == this.viewModel.itemCnt {
                    guard let text = this.searchBar.text else { return }
                    
                    this.viewModel.request(text: text)
                }
            }
            .disposed(by: disposeBag)
    }
    
    func setUI() {
        tableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        tableView.keyboardDismissMode = .onDrag
        view.addSubview(activityIndicator)
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

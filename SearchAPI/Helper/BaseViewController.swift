//
//  BaseViewController.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import UIKit
import RxSwift

class BaseViewController<T>: UIViewController {
    var viewModel: T!
    var disposeBag = DisposeBag()
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
        activityIndicator.center = self.view.center
        activityIndicator.color = UIColor.red
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    deinit {
        print("🔲🔲🔲 deinit")
        disposeBag = DisposeBag()
    }
}


//
//  BaseViewController.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import UIKit
import RxSwift

class BaseViewController<T>: UIViewController {
    open var viewModel: T!
    open var disposeBag = DisposeBag()
    
    deinit {
        print("🔲🔲🔲 deinit")
        disposeBag = DisposeBag()
    }
}


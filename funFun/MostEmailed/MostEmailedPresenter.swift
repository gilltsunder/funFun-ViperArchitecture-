//
//  Presenter.swift
//  funFun
//
//  Created by Vlad Tretiak on 05/05/2021.
//

import Foundation

// object
// protocol
// ref to interactor, router, view

enum FetchError: Error {
    case failed
}

class MostEmailedPresenter: AnyPresenter {
    
    var view: AnyView?
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getArticles()
        }
    }
    
    var resultData = [ResponseResult]()
    
    func interactorDidFetchUsers(with results: Result<MostEmailedModel, Error>) {
        switch results {
        case .success(let result):
            resultData = result.results
            view?.update(with: result.results)
        case.failure:
            view?.update(with: "here error")
        }
    }
}

//
//  BaseProtocols.swift
//  funFun
//
//  Created by Vlad Tretiak on 05/05/2021.
//

import Foundation


protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [ResponseResult])
    func update(with error: String)
}

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getArticles()
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    var resultData: [ResponseResult] { get }
    
    func interactorDidFetchUsers(with results: Result<MostEmailedModel, Error>)
}

protocol  AnyRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}

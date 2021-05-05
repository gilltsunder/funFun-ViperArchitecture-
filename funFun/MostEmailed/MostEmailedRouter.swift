//
//  Router.swift
//  funFun
//
//  Created by Vlad Tretiak on 05/05/2021.
//

import Foundation
import UIKit


// object
// entry point

typealias EntryPoint = AnyView & UIViewController



class MostEmailedRouter: AnyRouter {
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = MostEmailedRouter()
        
        //assign VIP
        var view: AnyView = MostEmailedViewController()
        var presenter: AnyPresenter = MostEmailedPresenter()
        var interactor: AnyInteractor = MostEmailedInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPoint
        
        return router
    }
}

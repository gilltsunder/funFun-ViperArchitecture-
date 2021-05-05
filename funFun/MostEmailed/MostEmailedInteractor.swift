//
//  Interactor.swift
//  funFun
//
//  Created by Vlad Tretiak on 05/05/2021.
//

import Foundation

// object
// protocol
// ref to presenter
// apiCall

class MostEmailedInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    
    func getArticles() {
        let networkService = NetworkService()
        networkService.request(router: .mostEmailed, model: MostEmailedModel.self) { [weak self] result in
            switch result {
            case .failure:
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            case .success(let entities):
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
                
            }
        }
    }
}


//https://api.nytimes.com/svc/mostpopular/v2/emailed/{period}.json
//https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=bMihebs1FBqcX9hR9LvOsApOUDDlS2Gi

//
//    func t() {
//        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=bMihebs1FBqcX9hR9LvOsApOUDDlS2Gi") else { return }
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            guard let data = data, error == nil else {
//                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
//                return
//            }
//
//            do {
//                let entities = try JSONDecoder().decode(MostEmailedModel.self, from: data)
////                self?.resultData = entities.results
//                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
//            } catch {
//                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
//            }
//
//        }
//        task.resume()
//        }

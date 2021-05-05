//
//  MostEmailedViewController.swift
//  funFun
//
//  Created by Vlad Tretiak on 05/05/2021.
//

import Foundation
import UIKit

// ViewController
// protocol
// reference presenter

class MostEmailedViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    func update(with users: [ResponseResult]) {
        DispatchQueue.main.async {
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        
    }
}

extension MostEmailedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text =  presenter?.resultData[indexPath.row].url
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.resultData.count ?? 0
    }
}

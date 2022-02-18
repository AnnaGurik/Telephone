//
//  ViewController.swift
//  Telephone
//
//  Created by d.bondarenko on 12.02.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchbar()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func setupSearchbar() {
        searchController.searchBar.delegate = self
        self.tableView.tableHeaderView = searchController.searchBar
        setupRightButton()
    }
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension ViewController {
    func setupRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(pushToCreate))
        navigationItem.rightBarButtonItem = rightButton
    }

    @objc
    func pushToCreate(_ sender: Any) {
        print("click")
    }
}

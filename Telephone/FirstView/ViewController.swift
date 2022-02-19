//
//  ViewController.swift
//  Telephone
//
//

import UIKit
import RealmSwift
import SnapKit

protocol ViewProtocol {
    func deletePerson(number: String)
}

class ViewController: UIViewController, ViewProtocol {
    // таблица
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .darkGray
        return tableView
    }()
    //менеджер для бд
    let modelManager = ModelManager()
    //итемы для бд
    var items: Results<ModelPerson>?
// при первой загрузке вызывается
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRightButton()
    }
// при повторной
    override func viewWillAppear(_ animated: Bool) {
        items = modelManager.gettingData()
        tableView.reloadData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // добавление таблички на экран и ее положение
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
// количество элементов
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
// создание ячеки из элементов в бд
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        guard let item = items?[indexPath.row] else { return cell }
        cell.delegate = self
        cell.name.text = "\(item.firstName) \(item.lastName)"
        
        cell.number.text = item.phone
        return cell
    }
// размер ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.width/6
    }

}

extension ViewController {
    // создание кнопки добавление
    func setupRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(pushToCreate))
        navigationItem.rightBarButtonItem = rightButton
    }
// при нажатии кнопки и переход на другой экран
    @objc
    func pushToCreate(_ sender: Any) {
        let createView = CreatePersonViewController()
        self.navigationController?.pushViewController(createView, animated: true)
    }
}

extension ViewController {
    func deletePerson(number: String) {
        modelManager.deletePerson(number: number)
        tableView.reloadData()
    }
}

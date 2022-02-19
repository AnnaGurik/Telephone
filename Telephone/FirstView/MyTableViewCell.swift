//
//  MyTableViewCell.swift
//  Telephone
//
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    var delegate: ViewProtocol?
    //контейнер для всего
    lazy var container: UIView = {
        return UIView()
    }()
// имя + фамилия
    lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
// номер
    lazy var number: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
// вызов сетапов
    override func layoutSubviews() {
        super.layoutSubviews()
        setups()
    }

    func setups() {
        setupContainer()
        setupName()
        setupNumber()
        setupButton()
    }
// создание и добавление контейнера
    func setupContainer() {
        contentView.addSubview(container)
        container.backgroundColor = .darkGray
        container.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(1)
            make.bottom.equalTo(contentView).inset(1)
            make.left.equalTo(contentView).inset(1)
            make.right.equalTo(contentView).inset(1)
        }
    }
// создание и добавление имение и фамилии
    func setupName() {
        container.addSubview(name)
        name.snp.makeConstraints { make in
            make.top.equalTo(container)
            make.bottom.equalTo(name.snp.top).inset(30)
            make.left.equalTo(container).inset(5)
            make.right.equalTo(container)
        }
    }
// создание и добавление номера
    func setupNumber() {
        container.addSubview(number)
        number.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom)
            make.left.equalTo(container).inset(5)
            make.right.equalTo(container).inset(contentView.bounds.width/4-1)
            make.bottom.equalTo(container)
        }
    }
// создание и добавление кнопки
    func setupButton() {
        let button = UIButton()
        button.addTarget(self, action: #selector(deletePerson), for: .touchUpInside)
        button.setTitle("Удалить", for: .normal)
        container.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom)
            make.left.equalTo(number.snp.right)
            make.bottom.equalTo(container)
            make.right.equalTo(container)
        }
    }

    @objc
    func deletePerson(_ sender: Any) {
        delegate?.deletePerson(number: number.text ?? "")
    }
}

//
//  CreatePersonViewController.swift
//  Telephone
//
//

import UIKit
import SnapKit

class CreatePersonViewController: UIViewController {

    lazy var firstName: UILabel = {
        let label = UILabel()
        label.text = "First Name:"
        label.textColor = .white
        return label
    }()
    lazy var lastName: UILabel = {
        let label = UILabel()
        label.text = "Last Name:"
        label.textColor = .white
        return label
    }()
    lazy var number: UILabel = {
        let label = UILabel()
        label.text = "Phone number:"
        label.textColor = .white
        return label
    }()

    lazy var firstNameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        return textField
    }()
    lazy var lastNameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        return textField
    }()
    lazy var numberField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        return textField
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setups()
        
    }
// менеджер для бд
    let modelManager = ModelManager()

}

extension CreatePersonViewController {
    func setups() {
        rightBarButtonSetup()
        setupFirstNameView()
        setupLastNameView()
        setupNumberView()
        
    }
// создание и добавление имени
    func setupFirstNameView() {
        view.addSubview(firstName)
        firstName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(view.bounds.width/5)
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
            make.bottom.equalTo(firstName.snp.top).inset(50)
        }

        view.addSubview(firstNameField)
        firstNameField.snp.makeConstraints { make in
            make.top.equalTo(firstName.snp.bottom)
            make.bottom.equalTo(firstNameField.snp.top).inset(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
// создание и добавление фамилии
    func setupLastNameView() {
        view.addSubview(lastName)
        lastName.snp.makeConstraints { make in
            make.top.equalTo(firstNameField.snp.bottom)
            make.bottom.equalTo(lastName.snp.top).inset(50)
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
        }

        view.addSubview(lastNameField)
        lastNameField.snp.makeConstraints { make in
            make.top.equalTo(lastName.snp.bottom)
            make.bottom.equalTo(lastNameField.snp.top).inset(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
// создание и добавление номера
    func setupNumberView() {
        view.addSubview(number)
        number.snp.makeConstraints { make in
            make.top.equalTo(lastNameField.snp.bottom)
            make.bottom.equalTo(number.snp.top).inset(50)
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
        }

        view.addSubview(numberField)
        numberField.snp.makeConstraints { make in
            make.top.equalTo(number.snp.bottom)
            make.bottom.equalTo(numberField.snp.top).inset(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
// создание и добавление кнопки добавление
    func rightBarButtonSetup() {
        let rightButton = UIBarButtonItem(title: "Добавить", style: .done, target: self, action: #selector(addContact))
        navigationItem.rightBarButtonItem = rightButton
        
    }
// добавление итема и возвращение на прошлый экран
    @objc
    func addContact(_ sender: Any) {
        if firstNameField.text != "" && lastNameField.text != "" && numberField.text != "" {
            modelManager.addPerson(firstName: firstNameField.text ?? "none", lastName: lastNameField.text ?? "none", number: numberField.text ?? "none")
            backToRoot()
        }
    }
// возвращение на первый экран
    func backToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}

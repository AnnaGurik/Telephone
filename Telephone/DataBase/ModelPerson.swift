//
//  ModelPerson.swift
//  Telephone
//
//

import Foundation
import RealmSwift

class ModelPerson: Object {
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var phone = ""
}

//
//  ModelManager.swift
//  Telephone
//
//

import Foundation
import RealmSwift

class ModelManager {
    let realm = try! Realm()
    var items: Results<ModelPerson>!

    func addPerson(firstName: String, lastName: String, number: String) {
        try! realm.write {
            let model = ModelPerson()
            model.firstName = firstName
            model.lastName = lastName
            model.phone = number

            realm.add(model)
        }
    }

    func deletePerson(number: String) {
        let pers = realm.objects(ModelPerson.self).filter("phone = '\(number)'")
        try! realm.write {
            realm.delete(pers)
        }
    }

    func gettingData() -> Results<ModelPerson> {
        items = realm.objects(ModelPerson.self)
        return items
    }
}

//
//  File.swift
//  LoginApp2
//
//  Created by Алиага С on 21.6.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "User",
             password: "Password",
             person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Hanzo", surname: "Hasasi", image: "HanzoH")
    }
}

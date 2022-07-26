//
//  RegisterViewModel.swift
//  Gifty
//
//  Created by Michael Amiro on 11/07/2022.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

    func isValid() -> Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty
    }

    func submit() {
        print("Performing login in view model")
    }
}

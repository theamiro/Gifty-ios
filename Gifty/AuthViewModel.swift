//
//  AuthView.swift
//  Gifty
//
//  Created by Michael Amiro on 08/07/2022.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @AppStorage("AUTH_KEY") var authenticated = false {
        willSet { objectWillChange.send() }
    }
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var invalid: Bool = false
    
    init() {
        print("logged on", username)
    }

    func isValid() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }
}

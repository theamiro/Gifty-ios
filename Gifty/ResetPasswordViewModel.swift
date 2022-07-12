//
//  ResetPasswordViewModel.swift
//  Gifty
//
//  Created by Michael Amiro on 11/07/2022.
//

import Foundation

class ResetPasswordViewModel: ObservableObject {
    @Published var email: String = ""

    func isValid() -> Bool {
        return !email.isEmpty
    }
}

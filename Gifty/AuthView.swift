//
//  AuthView.swift
//  Gifty
//
//  Created by Michael Amiro on 08/07/2022.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Log in")
                    .font(.title.weight(.bold))
                VStack(spacing: 15) {
                    RegularTextField(
                        text: $viewModel.username,
                        title: "Username",
                        placeholder: "Username",
                        errorMessage: "Username is not valid.",
                        textContextType: .username,
                        autocapitalize: .never)
                    SecureTextField(
                        text: $viewModel.password,
                        title: "Password",
                        placeholder: "Password",
                        showLabel: true,
                        messageText: "Password you entered is too short")
                }
                Button("Log in") {
                    print("login")
                }
                .disabled(!viewModel.isValid())
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 46)
                .background(viewModel.isValid() ? Color.accentColor : Color.gray)
                .cornerRadius(8)
                VStack(spacing: 40) {
                    HStack (spacing: 2) {
                        Button("Sign up") {

                        }
                        .buttonStyle(.plain)
                        .foregroundColor(.accentColor)
                        Spacer()
                        Button("Forgot Password") {

                        }
                        .buttonStyle(.plain)
                        .foregroundColor(.accentColor)
                    }.font(.custom(CustomFont.medium, size: 14))
                }
            }.padding()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

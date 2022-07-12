//
//  RegistrationView.swift
//  Gifty
//
//  Created by Michael Amiro on 11/07/2022.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @State private var showPassword: Bool = true
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sign up")
                    .font(.title.weight(.bold))
                VStack(spacing: 15) {
                    RegularTextField(
                        text: $viewModel.firstName,
                        title: "First Name",
                        placeholder: "John",
                        showLabel: true,
                        errorMessage: "First name is not valid, please try again.",
                        disableAutocorrect: true,
                        textContextType: .givenName)
                    RegularTextField(
                        text: $viewModel.lastName,
                        title: "Last Name",
                        placeholder: "Doe",
                        showLabel: true,
                        errorMessage: "Last name is not valid, please try again.",
                        disableAutocorrect: true,
                        textContextType: .familyName)
                    RegularTextField(
                        text: $viewModel.email,
                        title: "Email Address",
                        placeholder: "johndoe@mail.com",
                        showLabel: true,
                        errorMessage: "Email address is not valid, please try again.",
                        disableAutocorrect: true,
                        textContextType: .emailAddress)
                    SecureTextField(
                        text: $viewModel.password,
                        title: "Password",
                        placeholder: "Password",
                        showLabel: true,
                        messageText: "The password you entered is too short.")
                }
                VStack(alignment: .center, spacing: 10) {
                    Button {
                        print("login")
                    } label: {
                        Text("Create account")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 46)
                    }
                    .disabled(!viewModel.isValid())
                    .background(viewModel.isValid() ? Color.accentColor : Color.gray)
                    .cornerRadius(8)
                    VStack {
                        Text("By creating an account, you agree to the ")
                            .foregroundColor(.secondary)
                        Link(destination: URL(string: "https://twitter.com/theamiro")!) {
                            Text("terms and conditions")
                                .font(.custom(CustomFont.bold, size: 13))
                        }
                    }.font(.custom(CustomFont.regular, size: 13))
                }
                Button {

                } label: {
                    VStack(spacing: 0) {
                        Text("Already have an account?").font(.caption.weight(.medium))
                        Text("Log in").fontWeight(.medium)
                    }
                    .foregroundColor(.accentColor)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 52)
                }
                .background(Color.yellow)
                .cornerRadius(8)

            }.padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .previewDevice("iPhone 12")
    }
}

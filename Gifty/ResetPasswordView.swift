//
//  ResetPasswordView.swift
//  Gifty
//
//  Created by Michael Amiro on 11/07/2022.
//

import SwiftUI

struct ResetPasswordView: View {
    @ObservedObject var viewModel = ResetPasswordViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Button {

                } label: {
                    Image(systemName: "multiply")
                        .font(.custom(CustomFont.regular, size: 30))
                        .frame(width: 42, height: 42, alignment: .center)
                }

                Text("Reset Password")
                    .font(.title.weight(.bold))
                VStack(spacing: 15) {
                    RegularTextField(
                        text: $viewModel.email,
                        title: "Email Address",
                        placeholder: "johndoe@mail.com",
                        errorMessage: "Email Address is not valid.",
                        textContextType: .username,
                        autocapitalize: .never)
                }
                Button("Send reset instructions") {
                    print("login")
                }
                .disabled(!viewModel.isValid())
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 46)
                .background(viewModel.isValid() ? Color.accentColor : Color.gray)
                .cornerRadius(8)
            }.padding()
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}

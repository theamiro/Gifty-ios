//
//  TextFields.swift
//  Gifty
//
//  Created by Michael Amiro on 11/07/2022.
//

import SwiftUI

struct RegularTextField: View {
    @Binding var text: String
    var title: String
    var placeholder: String?
    var showLabel: Bool = true
    var errorMessage: String
    var disableAutocorrect: Bool = false
    var textContextType: UITextContentType
    var autocapitalize: TextInputAutocapitalization = .words
    
    var isValidated: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            if showLabel{
                Text(title)
                    .font(.custom(CustomFont.medium, size: 14))
                    .foregroundColor(.accentColor)
            }
            TextField(placeholder ?? title, text: $text)
                .padding()
                .background(.gray.opacity(0.2))
                .frame(maxHeight: 42)
                .cornerRadius(8)
                .textContentType(textContextType)
                .disableAutocorrection(disableAutocorrect)
                .textInputAutocapitalization(textContextType == .emailAddress || textContextType == .username ? .never : autocapitalize)
                .font(.custom(CustomFont.regular, size: 15))
            Text(errorMessage)
                .foregroundColor(.red)
                .font(.custom(CustomFont.medium, size: 12))
                .padding(.horizontal)
        }
    }
}

struct SecureTextField: View {
    @Binding var text: String
    var title: String
    var placeholder: String
    var showLabel: Bool
    var messageText: String
    var isValidated: Bool = false
    
    @State var showPassword: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if showLabel {
                Text(title)
                    .font(.custom(CustomFont.medium, size: 14))
                    .foregroundColor(.accentColor)
            }
            ZStack(alignment: .trailing) {
                Group {
                    if showPassword {
                        TextField(placeholder, text: $text)
                    } else {
                        SecureField(placeholder, text: $text)
                    }
                }
                .padding()
                .padding(.trailing, 60)
                .background(.gray.opacity(0.2))
                .frame(maxHeight: 42)
                .cornerRadius(8, antialiased: true)
                .textInputAutocapitalization(.none)
                .disableAutocorrection(true)
                .textContentType(.password)
                .font(.custom(CustomFont.regular, size: 15))
                Button {
                    showPassword.toggle()
                } label: {
                    HStack {
                        Text(showPassword ? "HIDE" : "SHOW")
                            .font(.custom(CustomFont.bold, size: 10))
                        Image(systemName: showPassword ? "eye.slash" : "eye").font(.custom(CustomFont.bold, size: 14))
                    }
                }.padding(.horizontal, 10)
            }
            Text(messageText)
                .foregroundColor(.red)
                .font(.custom(CustomFont.medium, size: 12))
                .padding(.horizontal)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegularTextField(text: .constant(""), title: "Sample", placeholder: "Placeholder", errorMessage: "Sample error message", textContextType: .familyName)
                .previewLayout(.sizeThatFits)
            SecureTextField(text: .constant(""), title: "Sample", placeholder: "Placeholder", showLabel: true, messageText: "Sample error message")
                .previewLayout(.sizeThatFits)
        }
    }
}

//
//  AuthView.swift
//  Gifty
//
//  Created by Michael Amiro on 12/07/2022.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .ignoresSafeArea()
            VStack(spacing: 10) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        VStack(spacing: 10) {
                            Image("someone")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300)
                            Text("This is an example of how things work and how they should be represented")
                                .font(.custom(CustomFont.medium, size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 30)
                        }
                        .padding(.top, 80)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        VStack(spacing: 10) {
                            Image("someone")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300)
                            Text("This is an example of how things work and how they should be represented")
                                .font(.custom(CustomFont.medium, size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 30)
                        }
                        .padding(.top, 80)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                    }
                }
                Spacer()
                Group {CustomButton(title: "Create account") {
                    print("Create account")
                }
                CustomButton(title: "Log in", buttonColor: Color.secondaryColor, buttonStyle: .bordered) {
                    print("Login")
                }
                Text("Make your event memorable, if you dare!")
                    .font(.custom(CustomFont.regular, size: 10))
                    .foregroundColor(.gray)
                }.padding()
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

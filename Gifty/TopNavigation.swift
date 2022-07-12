//
//  NavigationView.swift
//  Gifty
//
//  Created by Michael Amiro on 05/07/2022.
//

import SwiftUI

enum CustomFont {
    static let light = "OpenSans-Light"
    static let regular = "OpenSans-Regular"
    static let medium = "OpenSans-Medium"
    static let semibold = "OpenSans-SemiBold"
    static let bold = "OpenSans-Bold"
    static let heavy = "OpenSans-ExtraBold"
}

struct TopNavigation: View {
    var title: String = ""
    @State private var showBackButton: Bool = false
    var body: some View {
        HStack {
            if showBackButton {
                Button {
                    popViewController()
                } label: {
                    Image(systemName: "arrow.left")
                }
            } else {
                Image("someone")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36, alignment: .center)
                    .cornerRadius(18, antialiased: true)
            }
            Spacer()
            Text("Gifty")
                .font(.custom(CustomFont.semibold, size: 15))
                .multilineTextAlignment(.center)
                .lineLimit(1)
            Spacer()
            Image(systemName: "text.justify.trailing")
                .frame(width: 36, height: 36, alignment: .center)
        }
        .frame(width: nil, height: 50, alignment: .center)
        .padding(.horizontal)
        .background(.regularMaterial)
        .cornerRadius(25, antialiased: true)
        .padding(.horizontal)
        .padding(.top, 46)
    }

    func popViewController() {

    }
}

struct TopNavigation_Previews: PreviewProvider {
    static var previews: some View {
        TopNavigation(title: "Navigation")
            .preferredColorScheme(.dark)
    }
}

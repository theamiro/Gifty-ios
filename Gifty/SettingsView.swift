//
//  SettingsView.swift
//  Gifty
//
//  Created by Michael Amiro on 05/07/2022.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case earth
    case fire
    case water
}

struct SettingsView: View {
    @Binding var theme: Theme
    @State var viewModel = SettingsViewModel()
    var body: some View {
        Form {
            Section {
                NavigationLink {

                } label: {
                    HStack(spacing: 15) {
                        Image("someone")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 54, height: 54, alignment: .center)
                            .cornerRadius(27, antialiased: true)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Michael Amiro").font(.custom(CustomFont.medium, size: 20))
                            Text("Account, Subscriptions, Payments").font(.custom(CustomFont.regular, size: 12))
                        }
                    }.padding(.vertical, 8)
                }
            }
            Section {
                Picker("App Theme", selection: $theme) {
                    ForEach(Theme.allCases, id: \.rawValue) { theme in
                        HStack {
                            Text(theme.rawValue.capitalized).tag(theme)
                            Spacer()
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.red)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                    }

                    .navigationBarHidden(true)
                }
                Toggle("Dark Mode", isOn: .constant(true))
                Toggle("Use System Settings", isOn: .constant(true))
            } header: {
                Text("Theme")
            } footer: {
                Text("System settings will override dark mode and use the current device theme.")
            }
            Section {
                NavigationLink {

                } label: {
                    Text("Notification Settings")
                }
            } header: {
                Text("Notifications")
            }
            Section {
                Link(destination: URL(string: "https://twitter.com/theamiro")!) {
                    HStack(spacing: 16) {
                        Image(systemName: "link")
                        Text("Buy me a coffee")
                            .foregroundColor(.primary)
                    }
                }
                Link(destination: URL(string: "https://twitter.com/theamiro")!) {
                    HStack(spacing: 16) {
                        Image(systemName: "paperplane.fill")
                        Text("Follow me on ").foregroundColor(.primary) + Text("Twitter")
                    }
                }

            }.font(.custom(CustomFont.medium, size: 14))
            Section {
                Button {
                    viewModel.signOutUser { username in

                    }
                } label: {
                    Text("Sign Out")
                        .font(.custom(CustomFont.medium, size: 14))
                        .foregroundColor(.red)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }

            }
        }
        .font(.custom(CustomFont.regular, size: 14))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(theme: .constant(.earth))
    }
}

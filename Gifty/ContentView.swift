//
//  ContentView.swift
//  Gifty
//
//  Created by Michael Amiro on 04/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    @State private var theme = false

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        NavigationView{
        TabView(selection: $selectedTab) {
                Text("Home")
                    .tag(Tab.house)
                Text("Person")
                .tag(Tab.person)

                ActivityView()
                .tag(Tab.message)
                SettingsView(theme: .constant(.earth))
                .tag(Tab.gearshape)
        }
        .navigationBarTitle(selectedTab.description)
        .navigationBarTitleDisplayMode(.inline)
        }
        .overlay(
            ZStack {
                VStack {
                    Spacer()
                    TabBarView(selectedTab: $selectedTab)
                }.ignoresSafeArea()
            }.frame(maxHeight: .infinity, alignment: .top)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

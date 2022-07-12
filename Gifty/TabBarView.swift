//
//  TabBarView.swift
//  Gifty
//
//  Created by Michael Amiro on 04/07/2022.
//

import SwiftUI
enum Tab: String, CaseIterable {
    case house
    case message
    case person
    case gearshape

    var description: String {
        switch self {
        case .house:
            return "Home"
        case .message:
            return "Activity"
        case .person:
            return "Account"
        case .gearshape:
            return "Settings"
        }
    }
}

struct TabBarView: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: selectedTab == .house ? fillImage : Tab.house.rawValue)
                    .scaleEffect(selectedTab == .house ? 1.1 : 1.0)
                    .foregroundColor(selectedTab == .house ? .accentColor : .gray.opacity(1))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = .house
                        }
                    }
                Spacer()
                Image(systemName: selectedTab == .person ? fillImage : Tab.person.rawValue)
                    .scaleEffect(selectedTab == .person ? 1.1 : 1.0)
                    .foregroundColor(selectedTab == .person ? .accentColor : .gray.opacity(1))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = .person
                        }
                    }
                Spacer()
                Image(systemName: selectedTab == .message ? fillImage : Tab.message.rawValue)
                    .scaleEffect(selectedTab == .message ? 1.1 : 1.0)
                    .foregroundColor(selectedTab == .message ? .accentColor : .gray.opacity(1))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = .message
                        }
                    }
                Spacer()
                Image(systemName: selectedTab == .gearshape ? fillImage : Tab.gearshape.rawValue)
                    .scaleEffect(selectedTab == .gearshape ? 1.1 : 1.0)
                    .foregroundColor(selectedTab == .gearshape ? .accentColor : .gray.opacity(1))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = .gearshape
                        }
                    }
                Spacer()
            }
            .frame(width: nil, height: 60, alignment: .center)
            .background(.thinMaterial)
            .cornerRadius(30, antialiased: true)
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.house))
            .preferredColorScheme(.dark)
    }
}

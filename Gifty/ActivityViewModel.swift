//
//  ActivityViewModel.swift
//  Gifty
//
//  Created by Michael Amiro on 05/07/2022.
//

import SwiftUI

class ActivityViewModel: ObservableObject {
    @State var activities: [Activity] = [
        Activity(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..", isRead: false,createdAt: "20 mins ago", updatedAt: "20 mins ago"),
        Activity(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isRead: false,createdAt: "22 mins ago", updatedAt: "22 mins ago"),
        Activity(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", isRead: true,createdAt: "24 mins ago", updatedAt: "24 mins ago"),
    ]
    
    func markAsRead(_ activity: Activity) {
        let result = activities.first { item in
            activity.id == item.id
        }
        if var result = result {
            result.isRead = true
        }
    }

    func delete(_ activity: Activity) {
        activities.removeAll { item in
            activity.id == item.id
        }
    }
}

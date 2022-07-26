//
//  ActivityItemView.swift
//  Gifty
//
//  Created by Michael Amiro on 12/07/2022.
//

import SwiftUI

struct ActivityItemView: View {
    @State var activity: Activity
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "paperplane.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(activity.isRead ? Color.gray.opacity(0.7) : Color.primaryColor)
                .frame(width: 28, height: 28, alignment: .center)
            VStack(alignment: .leading, spacing: 1) {
                Text(activity.message)
                    .font(.custom(activity.isRead ? CustomFont.regular : CustomFont.semibold, size: 13))
                    .lineLimit(2)
                Text(activity.createdAt)
                    .font(.custom(CustomFont.regular, size: 12))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .frame(width: nil)
        .padding(.vertical, 5)
    }
}

struct ActivityItemView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityItemView(activity: Activity(message: "Inside there you will usually want to call Swift’s remove(atOffsets:) method to delete the requested rows from your sequence.", isRead: false, createdAt: "20 mins ago", updatedAt: "20 mins ago"))
    }
}

//
//  NotificationsView.swift
//  Gifty
//
//  Created by Michael Amiro on 05/07/2022.
//

import SwiftUI

struct ActivityView: View {
    var viewModel = ActivityViewModel()

    var body: some View {
        Form {
            Section {
                ForEach(viewModel.activities, id: \.id) { activity in
                    ActivityItemView(activity: activity)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                withAnimation {
                                    viewModel.delete(activity)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                withAnimation {
                                    viewModel.markAsRead(activity)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }.tint(.primaryColor)
                        }
                }
            }
        }

        //        if viewModel.activities.count > 0 {
        //
        //        } else {
        //            VStack {
        //                Image("someone")
        //                    .resizable()
        //                    .aspectRatio(contentMode: .fit)
        //                    .frame(width: 200, height: 200, alignment: .center)
        //                Text("You don't have any new activities on your account. We will notify you when we also get the updates.")
        //                    .foregroundColor(.primary.opacity(0.6))
        //                    .font(.custom(CustomFont.regular, size: 15))
        //                    .multilineTextAlignment(.center)
        //            }.padding()
        //        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}

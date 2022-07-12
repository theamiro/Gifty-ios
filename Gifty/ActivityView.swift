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
        if viewModel.activities.count > 0 {
            Form {
                ForEach(viewModel.activities, id: \.id) { activity in
                    HStack(spacing: 15) {
                        Image("someone")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50, alignment: .center)
                            .cornerRadius(8)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("**Joy Mwiti** has contributed KES 20,000 to your wedding registry.")
                                .font(.custom(CustomFont.regular, size: 13))
                            Text("20 mins ago")
                                .font(.custom(CustomFont.regular, size: 12))
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
        } else {
            VStack {
                Image("someone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                Text("You don't have any new activities on your account. We will notify you when we also get the updates.")
                    .foregroundColor(.primary.opacity(0.6))
                    .font(.custom(CustomFont.regular, size: 15))
                    .multilineTextAlignment(.center)
            }.padding()
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}

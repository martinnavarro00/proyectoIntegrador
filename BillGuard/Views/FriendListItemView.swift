//
//  FriendListItemView.swift
//  BillGuard
//
//  Created by Martin Navarro on 13/2/24.
//

import SwiftUI

struct FriendListItemView: View {
    var name: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                    Text(name)
                        .bold()
                        .font(.headline)
                }
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThickMaterial)
                .frame(width: 310, height: 50)
        )
        .padding()
    }
}

struct FriendListItemView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListItemView(name: "")
    }
}

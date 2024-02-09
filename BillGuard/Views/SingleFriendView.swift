//
//  SingleFriendView.swift
//  BillGuard
//
//  Created by Martin Navarro on 9/2/24.
//

import SwiftUI

struct SingleFriendView: View {
    @State var viewModel = FriendRequestViewViewModel()
    var name: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                    Text(name)
                        .bold()
                        .font(.headline)
                    Button{
                        
                    }label: {
                        Image(systemName: "xmark.circle")
                    }
                    
                    //Image(systemName: "xmark.circle")
                }
                Text("pending").font(.subheadline)
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

struct SingleFriendView_Previews: PreviewProvider {
    static var previews: some View {
        SingleFriendView(name: "")
    }
}

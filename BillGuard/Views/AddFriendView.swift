//
//  AddFriendView.swift
//  BillGuard
//
//  Created by Martin Navarro on 13/2/24.
//

import SwiftUI

struct AddFriendView: View {
    @State var title: String
    @State var viewModel = AddFriendViewViewModel()
    var body: some View {
        VStack{
            Text("Add Friend")
                .font(.title)
                .bold()
            HStack{
                Text("Email")
                TextField("Enter email", text: $viewModel.username)
            }.padding()
            Button{
                //action
                viewModel.sendFriendRequest(to: viewModel.username)
            }label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green)
                    Text("Send Invite")
                        .foregroundColor(Color.white)
                        .bold()
                }
            }.frame(width: 250,height: 40)
        }.padding()
        Spacer()
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView(title: "")
    }
}

//
//  FriendsView.swift
//  BillGuard
//
//  Created by Martin Navarro on 9/2/24.
//

import SwiftUI

struct FriendsView: View {
    @State private var isPresented:Bool = false
    @State private var isOverlayVisible = false
    @ObservedObject var viewModel=FriendsViewViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack {
                    VStack{
                        /*FriendListItemView(viewModel).frame(maxWidth: .infinity).onTapGesture {
                            // Toggle the overlay visibility on tap
                            isOverlayVisible.toggle()
                        }*/
                        if viewModel.userArray.isEmpty {
                            Text("No sender UIDs")
                        } else {
                            List(viewModel.userArray, id: \.self) { userData in
                                Text("Hola")
                                //FriendListItemView(name: userData.name)
                                /*SingleFriendView(name: userData.name)
                                    .swipeActions{
                                        Button("Delete"){
                                            viewModel.acceptFriendRequest(senderUID: userData.id)
                                        }.tint(.green)
                                    }*/
                            }.listStyle(PlainListStyle())
                        }
                        Spacer()

                        Button("Fetch User and Sender UIDs") {
                            viewModel.fetchUser(from: "senderUID")
                            viewModel.fetchSenderUIDs()
                        }
                    }
                }
            }.navigationTitle("Your Friends")
                .toolbar{
                    Button{
                        //action
                        isPresented.toggle()
                    }label: {
                        Text("Add Friend")
                    }.sheet(isPresented: $isPresented){
                        AddFriendView(title: "")
                    }
                }
        }
        
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

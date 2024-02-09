//
//  FriendRequestView.swift
//  BillGuard
//
//  Created by Martin Navarro on 25/2/24.
//
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

/*struct FriendRequestView: View {
    @State var viewModel = FriendRequestViewViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                Button("load"){
                    viewModel.fetchSenderUIDs()
                }
                List(viewModel.senderUIDs, id: \.self) { senderUID in
                                Text("Friend Request Sender UID: \(senderUID)")
                            }
            }.navigationTitle("Friends Requests")
                
        }
        
    }
}

struct FriendRequestView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestView()
    }
}*/


struct FriendRequestView: View {
    @ObservedObject var viewModel = FriendRequestViewViewModel()

    var body: some View {
        VStack {
            Divider()

            Text("Your Friend Request:")
            if viewModel.userArray.isEmpty {
                Text("No sender UIDs")
            } else {
                List(viewModel.userArray, id: \.self) { userData in
                    SingleFriendView(name: userData.name)
                        .contextMenu{
                            Button{
                                viewModel.acceptFriendRequest(senderUID: userData.id)
                            }label: {
                                Text("Accept Friend Request")
                            }
                            Button{
                                //viewModel.acceptFriendRequest(senderUID: userData.id)
                            }label: {
                                Text("Reject Friend Request")
                            }
                        }
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
                viewModel.fetchUser(from: "senderUID") // Replace "senderUID" with the actual sender UID
                viewModel.fetchSenderUIDs()
            }
            .padding()
        }
    }
}

struct FriendRequestView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestView()
    }
}

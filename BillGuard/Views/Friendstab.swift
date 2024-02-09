//
//  Friendstab.swift
//  BillGuard
//
//  Created by Martin Navarro on 21/2/24.
//

import SwiftUI

struct Friendstab: View {
    @State var tabSelectedValue = 0
    var body: some View {
        
        VStack {
            
            Picker("", selection: $tabSelectedValue) {
                Text("Friends").tag(0)
                Text("Requests").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            TabView(selection: $tabSelectedValue) {
                FriendsView()
                    .tag(0)
                
                FriendRequestView()
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct Friendstab_Previews: PreviewProvider {
    static var previews: some View {
        Friendstab()
    }
}


struct FriendsViews: View {
    @State private var isPresented:Bool = false
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    //FriendListItemView()
                    Button{
                        isPresented.toggle()
                            
                    }label: {
                        Text("Hola")
                    }.sheet(isPresented: $isPresented){
                        Color.clear
                            .presentationDetents([.height(500)])
                        VStack{
                            //FriendListItemView()
                            ContactCardView(account: "", type: "",bank: "")
                            
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

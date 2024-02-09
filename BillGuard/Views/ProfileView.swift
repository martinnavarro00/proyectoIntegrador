//
//  ProfileView.swift
//  BillGuard
//
//  Created by Martin Navarro on 8/2/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                }
                else{
                    Text("Loading Profile...")
                }
                
            }.navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user:User)-> some View {
        NavigationView{
            ScrollView{
                Button{
                    //action
                }label: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width:125, height: 125)
                        .padding()
                }
                 
                VStack(alignment: .leading){
                    HStack{
                        Text("Name: ")
                            .bold()
                        Text(user.name)
                    }.padding()
                    HStack{
                        Text("Email: ")
                            .bold()
                        Text(user.email)
                    }.padding()
                    HStack{
                        Text("Member Since: ")
                            .bold()
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    }.padding()
                    ContactCardView(account: "", type: "",bank: "")
                    Button("Log Out"){
                        viewModel.logOut()
                    }
                    VStack{
                        Text("Hola")
                    }
                    
                }.padding()
                
            }.navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//
//  ContentView.swift
//  BillGuard
//
//  Created by Martin Navarro on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            appView
        }else{
            LoginView()
        }
        
    }
    var appView: some View {
        TabView{
            DashboardView()
                .tabItem{
                    Label("Home",systemImage: "square.grid.2x2")
                }
            NewItemView(title: "", date: Date(), prst: false)
                .tabItem{
                    Label("Add", systemImage: "plus")
                }
            Friendstab()
                .tabItem{
                    Label("Friends",systemImage: "person")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage: "person")
                }
            }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

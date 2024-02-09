//
//  LoginView.swift
//  BillGuard
//
//  Created by Martin Navarro on 21/2/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel=LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "BillGuard", subtitle: "Share your Bills", angle: 15, background: .pink)
                
                //Login form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                        
                    }
                    .padding()
                }
                .offset(y:-50)
                
                //Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }.padding(.bottom,50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

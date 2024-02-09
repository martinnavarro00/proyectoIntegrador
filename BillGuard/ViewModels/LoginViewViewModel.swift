//
//  LoginViewViewModel.swift
//  BillGuard
//
//  Created by Martin Navarro on 24/2/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email=""
    @Published var password=""
    @Published var errorMessage=""
    init(){}
    
    func login(){
        guard validate() else{
            return
        }
        
        //try to log
        Auth.auth().signIn(withEmail: email, password: password)
        
        
    }
    func validate()->Bool{
        errorMessage=""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage="Please Fill all Fields"
            return false
        }
        
        //email
        guard email.contains("@") && email.contains(".")else{
            errorMessage="Please enter valid email."
            return false
        }
        return true
    }
    
}

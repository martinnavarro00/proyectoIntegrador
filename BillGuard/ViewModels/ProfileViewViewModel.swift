//
//  ProfileViewViewModel.swift
//  BillGuard
//
//  Created by Martin Navarro on 24/2/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject{
    init(){}
    
    @Published var user: User? = nil
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db=Firestore.firestore()
        db.collection("user").document(uid).getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
        
                
    }
    func logOut(){
        do{
            try Auth.auth().signOut()
        }
        catch{
            print(error)
        }
    }
}

//
//  FriendsViewViewModel.swift
//  BillGuard
//
//  Created by Martin Navarro on 25/2/24.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation

class FriendsViewViewModel: ObservableObject{
    @Published var userArray: [User] = []
    @Published var user: User? = nil
    
    init() {}
    func fetchUser(from sender: String) {
        let db = Firestore.firestore()
        db.collection("user").document(sender).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                // Handle error, e.g., print an error message
                print("Error fetching user data: \(error?.localizedDescription ?? "Unknown error")")
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
    
    func fetchSenderUIDs() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        let userDocRef = db.collection("user").document(uid)
        
        // Get the user document
        userDocRef.getDocument { [weak self] (document, error) in
            if let error = error {
                print("Error getting user document: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                if let friends = document.get("friends") as? [[String: Any]] {
                    self?.userArray.removeAll()
                    
                    // Loop through all friend objects and fetch details
                    for friend in friends {
                        if let friendID = friend["id"] as? String {
                            db.collection("user").document(friendID).getDocument { [weak self] snapshot, error in
                                guard let data = snapshot?.data(), error == nil else {
                                    print("Error fetching details for friend \(friendID): \(error?.localizedDescription ?? "Unknown error")")
                                    return
                                }
                                
                                DispatchQueue.main.async {
                                    let user = User(
                                        id: data["id"] as? String ?? "",
                                        name: data["name"] as? String ?? "",
                                        email: data["email"] as? String ?? "",
                                        joined: data["joined"] as? TimeInterval ?? 0
                                    )
                                    self?.userArray.append(user)
                                }
                            }
                        }
                    }
                }
            } else {
                print("User document does not exist")
            }
        }
    }
}

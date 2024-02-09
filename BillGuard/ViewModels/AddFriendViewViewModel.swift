//
//  AddFriendViewViewModel.swift
//  BillGuard
//
//  Created by Martin Navarro on 25/2/24.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation

class AddFriendViewViewModel: ObservableObject{
    @Published var username=""

    init(){}
    
    
    func sendFriendRequest(to username: String) {
      // Find the user object based on username
        guard let uid=Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()

        // Assuming "user" is the correct collection name
        let usersCollection = db.collection("user")

        // Find the user document based on the username
        usersCollection
            .whereField("name", isEqualTo: username)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error fetching user document: \(error.localizedDescription)")
                    return
                }

                guard let documents = querySnapshot?.documents else {
                    print("No documents found for the given username.")
                    return
                }

                // Assuming there's only one user with a given username
                if let userDocument = documents.first {
                    let userDocRef = usersCollection.document(userDocument.documentID)

                    // Create the new friend request
                    let newFriend = FriendRequest(senderUID: uid, timestamp: Date().timeIntervalSince1970, status: "pending")

                    // Update the friendRequests array using FieldValue.arrayUnion
                    userDocRef.updateData([
                        "friendRequests": FieldValue.arrayUnion([newFriend.asDictionary()])
                    ]) { error in
                        if let error = error {
                            print("Error updating friend request: \(error.localizedDescription)")
                        } else {
                            print("Friend request updated successfully!")
                        }
                    }
                } else {
                    print("No user found with the given username.")
                }
            }
    }
}

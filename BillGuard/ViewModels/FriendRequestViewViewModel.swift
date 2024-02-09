import FirebaseAuth
import FirebaseFirestore
import Foundation

class FriendRequestViewViewModel: ObservableObject {
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
                // Handle error, e.g., print an error message
                print("Error getting user document: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                // Document exists, now you can access the friendRequests field
                if let friendRequests = document.get("friendRequests") as? [[String: Any]] {
                    // Clear previous senderUIDs
                    self?.userArray.removeAll()
                    
                    // Loop through all friend requests and collect sender UIDs
                    for friendRequest in friendRequests {
                        if let senderUID = friendRequest["senderUID"] as? String {
                            db.collection("user").document(senderUID).getDocument{ [weak self] snapshot, error in
                                guard let data = snapshot?.data(), error == nil else{
                                    return
                                }
                                
                                DispatchQueue.main.async {
                                    let user = User(id: data["id"] as? String ?? "",
                                                    name: data["name"] as? String ?? "",
                                                    email: data["email"] as? String ?? "",
                                                    joined: data["joined"] as? TimeInterval ?? 0)
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
    func acceptFriendRequest(senderUID: String) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        let userDocRef = db.collection("user").document(uid)
        
        // Remove friend request from the current user's friendRequests field
        userDocRef.updateData([
            "friendRequests.\(senderUID)": FieldValue.delete()]) { error in
            if let error = error {
                print("Error removing friend request from current user: \(error.localizedDescription)")
                return
            }
            
            // Optionally, you can update the friends list for the current user
            userDocRef.updateData([
                "friends": FieldValue.arrayUnion([friend(id: senderUID).asDictionary()])
            ]) { error in
                if let error = error {
                    print("Error adding friend to current user's friends list: \(error.localizedDescription)")
                }
            }
        }
        
        // Update both users Friend list
        let friendDocRef = db.collection("user").document(senderUID)
        friendDocRef.updateData([
            "friends": FieldValue.arrayUnion([friend(id: uid).asDictionary()])
        ]) { error in
            if let error = error {
                print("Error adding current user to friend's friends list: \(error.localizedDescription)")
            }
        }
        
        let friendDocRef2 = db.collection("user").document(uid)
        friendDocRef2.updateData([
            "friends": FieldValue.arrayUnion([friend(id: senderUID).asDictionary()])
        ]) { error in
            if let error = error {
                print("Error adding current user to friend's friends list: \(error.localizedDescription)")
            }
        }
    }
    
        
}


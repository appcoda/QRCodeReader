//
//  UserManager.swift
//  QRCodeReader
//
//  Created by Darkhonbek Mamataliev on 27/1/18.
//  Copyright © 2018 Darkhonbek. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseCore

public class UserManager {
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    var users: [String: User]

    public init() {
        self.users = [String: User]()
        performDatabaseInit()
    }

    public func performDatabaseInit() {
        FirebaseApp.configure()
        ref = Database.database().reference()
        databaseHandle = ref.child("users").observe(.childAdded, with: { (snapshot) in
            if let value = snapshot.value as? NSDictionary {
                let userID = value["id"] as? String ?? ""
                let state = value["state"] as? Bool ?? false
                let user = User(userID, state)
                self.users[userID] = user
            }
        })
    }

    public func checkUser(with id: String) -> AlertType {
        if let user = users[id] {
            if user.state {
                user.state = false
                updateDB(with: user)
                return .accepted
            } else {
                return .declined
            }
        } else {
            return .notFound
        }
    }

    private func updateDB(with updatedUser: User) {
        let key = updatedUser.id
        let user = ["id": updatedUser.id,
                    "state": updatedUser.state] as [String : Any]
        let childUpdates = ["/users/\(key)": user]
        ref.updateChildValues(childUpdates)
    }
}

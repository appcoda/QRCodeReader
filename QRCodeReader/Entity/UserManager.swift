//
//  Users.swift
//  QRCodeReader
//
//  Created by Darkhonbek Mamataliev on 27/1/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import Foundation

public class UserManager {
    private var users: [String: User]

    public init(users: [String: User]) {
        self.users = users
    }

    public func checkUser(with id: String) -> AlertType {
        if let user = users[id] {
            if user.state {
                user.state = false
                return .accepted
            } else {
                return .declined
            }
        } else {
            return .notFound
        }
    }
}

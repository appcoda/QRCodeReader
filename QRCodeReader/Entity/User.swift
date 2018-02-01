//
//  User.swift
//  QRCodeReader
//
//  Created by Darkhonbek Mamataliev on 26/1/18.
//  Copyright © 2018 Darkhonbek. All rights reserved.
//

import Foundation
import CoreData

// User state:
// true     - User NOT checked
// false    - User DID checked

public class User: Codable {
    public var id: String
    public var state: Bool

    public init(_ id: String, _ state: Bool) {
        self.id = id
        self.state = state
    }
}

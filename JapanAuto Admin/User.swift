//
//  User.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 3/20/25.
//

import Foundation

struct User: Identifiable, Equatable{
    let id = UUID()
    let name: String
    let email: String
    let location: String
    let role: String
    let status: Int
}

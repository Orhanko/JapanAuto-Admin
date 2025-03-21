//
//  UsersViewModel.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 3/20/25.
//

import Foundation
import SwiftUI

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var searchText: String = ""
    @Published var filteredUsers: [User] = []

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        self.users = [
            User(name: "James Smith", email: "james.smith@gmail.com", location: "PJ SARAJEVO", role: "Employee", status: 1),
            User(name: "Emily Johnson", email: "emily.johnson@email.com", location: "New York", role: "Unavailable", status: 0),
            User(name: "Michael Brown", email: "michael.brown@email.com", location: "Los Angeles", role: "Unavailable", status: 0),
            User(name: "Orhan Pojskic", email: "orhan.pojskic@gmail.com", location: "PJ SARAJEVO", role: "Employee", status: 1),
            User(name: "Omar Malkic", email: "omar.malkic@gmail.com", location: "PJ SARAJEVO", role: "Employee", status: 1)
        ]
        filteredUsers = users
    }

    func filterUsers() {
        withAnimation {
            if searchText.isEmpty {
                filteredUsers = users
            } else {
                filteredUsers = users.filter {
                    $0.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }
}

//
//  UsersView.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 2/19/25.
//

import SwiftUI

struct UsersView: View {
    var onLogout: () -> Void
    var body: some View {
        NavigationStack {
            VStack {
                Text("Users View!")
            }
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("ADMIN")
                        .foregroundColor(.secondary)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: onLogout) {
                        Text("Log Out")
                            .foregroundColor(.red)
                    }
                }
                ToolbarItem(placement: .principal){
                    Image("toolbarLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }

            }
        }
    }
}

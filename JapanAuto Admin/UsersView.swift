//
//  UsersView.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 2/19/25.
//

import SwiftUI

struct UsersView: View {
    var onLogout: () -> Void
    @StateObject var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredUsers, id: \.id) { user in
                            UserRowView(user: user)
                                .transition(.opacity) // 👈 Dodajemo animaciju nestajanja/pojavljivanja
                        }
                        .listStyle(.plain)
                        .navigationTitle("Users")
                        .searchable(text: $viewModel.searchText, prompt: "Search")
                        .onChange(of: viewModel.searchText) {
                            viewModel.filterUsers() // Filtriranje pokrećemo prilikom unosa u search
                        }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("ADMIN")
                        .foregroundColor(.secondary)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: onLogout) {
                        Text("Log Out")
                            .foregroundColor(.japanAutoRed)
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

struct UserRowView: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(user.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(user.role)
                .font(.subheadline)
                .foregroundColor(user.role == "Unavailable" ? .japanAutoRed : .green)

            Text(user.email)
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 8)

            HStack {
                Text(user.location)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text(user.status == 0 ? "Unavailable" : "Working")
                    .font(.caption)
                    .foregroundStyle(user.status == 0 ? .japanAutoRed : .secondary)
            }
        }
    }
}

#Preview{
    UsersView(onLogout: {print("true")})
}

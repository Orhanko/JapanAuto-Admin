//
//  UsersView.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 2/19/25.
//

import SwiftUI

struct UsersView: View {
    @State private var showAddUser = false
    var onLogout: () -> Void
    @StateObject var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing){
            List(viewModel.filteredUsers, id: \.id) { user in
                UserRowView(user: user)
                    .transition(.opacity) // 👈 Dodajemo animaciju nestajanja/pojavljivanja
            }
            .listStyle(.plain)
            
            .searchable(text: $viewModel.searchText, prompt: "Search")
            .onChange(of: viewModel.searchText) {
                viewModel.filterUsers() // Filtriranje pokrećemo prilikom unosa u search
            }
                Button(action: {
                    showAddUser = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.japanAutoRed)
                        .clipShape(Circle())
                        
                }
                .padding(.bottom)
                .padding(.trailing)
        }
            .navigationTitle("Users")
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Text("ADMIN")
                        .foregroundColor(.secondary)
                    addUserButton
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    addUserButton
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
            .sheet(isPresented: $showAddUser) {
                AddUserView()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
    var addUserButton: some View {
        
        Button(action: {
            showAddUser = true
        }) {
            Image(systemName: "plus")
                .foregroundStyle(.japanAutoRed)
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

struct AddUserView: View {
    
    private let addUserPlaceHolders = [
        "Name", "Email", "Status", "Role", "Location", "Password", "Confirm Password"
    ]
    
    @State private var textFields: [String] = Array(repeating: "", count: 5)
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ScrollView{
        VStack {
            // Prvih 5 običnih polja
            ForEach(0..<5, id: \.self) { index in
                customTextField(placeholder: addUserPlaceHolders[index], text: $textFields[index])
            }
            
            // Passwordi
            customSecureField(placeholder: addUserPlaceHolders[5], text: $password)
            customSecureField(placeholder: addUserPlaceHolders[6], text: $confirmPassword)
            Button(action: addNewUserPressed) {
                Text("Add new user")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.japanAutoRed)
                    .cornerRadius(4)
                    .padding(.horizontal, 24)
            }
        }.padding(.top, 32)
                .padding(.bottom)
    }
        .ignoresSafeArea(.keyboard) // Ne gura sadržaj kad se tastatura pojavi
    }
    
    func addNewUserPressed(){
        print("Add new user pressed!")
    }
    
    func customTextField(placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .padding(.leading)
            .padding(.vertical, 12)
            .background(Color(UIColor.quaternarySystemFill))
            .cornerRadius(4)
            .padding(.horizontal, 24)
            .autocapitalization(.none)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(UIColor.secondarySystemFill), lineWidth: 1.5)
                    .padding(.horizontal, 24)
            )
            .padding(.bottom)
    }
    
    func customSecureField(placeholder: String, text: Binding<String>) -> some View {
        SecureField(placeholder, text: text)
            .padding(.leading)
            .padding(.vertical, 12)
            .background(Color(UIColor.quaternarySystemFill))
            .cornerRadius(4)
            .padding(.horizontal, 24)
            .autocapitalization(.none)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(UIColor.secondarySystemFill), lineWidth: 1.5)
                    .padding(.horizontal, 24)
            )
            .padding(.bottom)
    }
}


#Preview{
    UsersView(onLogout: {print("true")})
}

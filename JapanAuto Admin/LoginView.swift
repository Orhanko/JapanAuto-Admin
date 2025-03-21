//
//  LoginView.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 2/19/25.
//

import SwiftUI

struct LoginView: View {
    var onLogIn: () -> Void
    @State var username = ""
    @State var password = ""
    @State private var isSecure: Bool = true
    @FocusState private var isFocused: Bool // 🔹 Fokus state za tastaturu
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
                .frame(maxHeight: 150)
            Image("loginLogo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300)
                .frame(maxWidth: .infinity, alignment: .center)
                
            Spacer()
            Text("Log In")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.japanAutoRed)
                .padding(.horizontal)
            
            TextField("Enter email", text: $username)
                .padding(.leading, 25)
                .padding(.vertical, 12)
                .background(Color(UIColor.quaternarySystemFill))
                .cornerRadius(4)
                .padding(.horizontal)
            
                .autocapitalization(.none)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(UIColor.secondarySystemFill), lineWidth: 1.5)
                        .padding(.horizontal)
                )
                .padding(.bottom, 15)
            
            SecureField("Enter password", text: $password)
                .padding(.trailing, 40)
                .padding(.leading, 25)
                .padding(.vertical, 12)
                .background(Color(UIColor.quaternarySystemFill))
                .cornerRadius(4)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(UIColor.secondarySystemFill), lineWidth: 1.5)
                        .padding(.horizontal)
                )
            
                .autocapitalization(.none)
            Spacer()
            Button(action: onLogIn) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.japanAutoRed)
                    .cornerRadius(4)
            }
            .padding()
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

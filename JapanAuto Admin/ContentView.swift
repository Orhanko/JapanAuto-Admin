//
//  ContentView.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 2/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    var body: some View {
        ZStack{
            if isLoggedIn{
                MainView(onLogout: handleLogOut)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }else{
                LoginView(onLogIn: handleLogIn)
                    .transition(.move(edge: .leading).combined(with: .opacity))
            }
        }.animation(.easeInOut(duration: 0.5), value: isLoggedIn)
    }
    private func handleLogOut() {
        withAnimation {
            isLoggedIn = false
        }
    }
    private func handleLogIn() {
        withAnimation {
            isLoggedIn = true
        }
    }
}

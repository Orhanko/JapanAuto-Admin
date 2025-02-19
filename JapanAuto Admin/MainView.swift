//
//  TabView.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 2/19/25.
//

import SwiftUI

struct MainView: View {
    var onLogout: () -> Void
    var body: some View {
        TabView {
            AnalyticsView()
                
                .tabItem {
                    Label("Analytics", systemImage: "chart.pie")
                }
            OrdersView()
                .tabItem {
                    Label("Orders", systemImage: "clock")
                }
            UsersView(onLogout: onLogout)
                .tabItem {
                    Label("Users", systemImage: "person")
                }
        }
        .accentColor(Color(#colorLiteral(red: 0.929, green: 0.109, blue: 0.141, alpha: 1)))
        .onAppear{
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()  // Opaque pozadina
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

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
        .accentColor(.japanAutoRed)
        .onAppear{
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()  // Opaque pozadina
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

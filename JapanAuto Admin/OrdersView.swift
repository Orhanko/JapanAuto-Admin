//
//  OrdersView.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 2/19/25.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Orders View!")
            }
            .navigationTitle("Orders")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("ADMIN")
                        .foregroundColor(.secondary)
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

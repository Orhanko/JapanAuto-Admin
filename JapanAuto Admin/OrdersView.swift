//
//  OrdersView.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 2/19/25.
//

import SwiftUI

struct OrdersView: View {
    let orders: [Order] = [
        Order(code: 2291, id: 291, date: "18.03.2024 09:12 ", status: "In delivery"),
        Order(code: 3461, id: 106, date: "18.03.2024 09:54 ", status: "In delivery"),
        Order(code: 5712, id: 224, date: "18.03.2024 09:21 ", status: "Rejected"),
        Order(code: 1297, id: 675, date: "18.03.2024 09:43 ", status: "In delivery"),
        Order(code: 5729, id: 113, date: "18.03.2024 09:31 ", status: "Finished")
    ]
    var body: some View {
        
        NavigationStack {
            VStack{
                HStack{
                    Text("Order")
                        .font(.caption)
                        .padding(.leading)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("Status")
                        .font(.caption)
                        .padding(.trailing)
                        .foregroundStyle(.secondary)
                        
                    
                }
                Rectangle()
                            .fill(Color(UIColor.separator))
                            .frame(height: 0.5)
                            .padding(.leading)
                    
                    
                List(orders) { order in
                    OrdersRowView(order: order)
                    
                }
                .listStyle(.plain)
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
    
    
    struct OrdersRowView: View {
        let order: Order
        
        var body: some View {
            VStack(alignment: .leading, spacing: 5) {
                HStack{
                    Image("orderRow") // Koristi tvoju sliku
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading){
                        Text("CODE: \(order.code)")
                        
                        
                        
                        Text("ID: \(order.id)")
                            .foregroundStyle(.japanAutoRed)
                        
                        
                        
                    }
                }
                HStack {
                    Text("Order creation date: ")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                    +
                    Text(order.date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(order.status)
                        .font(.caption)
                        .foregroundStyle(
                            order.status == "Rejected" ? .japanAutoRed :
                                order.status == "In delivery" ? .secondary :
                                Color.green
                        )
                    
                }
            }
            .padding(.vertical, 5)
//            .padding(.leading, 5)
        }
    }
}

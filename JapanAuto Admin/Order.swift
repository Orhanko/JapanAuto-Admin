//
//  Order.swift
//  JapanAuto Admin
//
//  Created by Orhan Pojskic on 3/21/25.
//

import Foundation

struct Order: Identifiable, Equatable{
    let code: Int
    let id: Int
    let date: String
    let status: String
}

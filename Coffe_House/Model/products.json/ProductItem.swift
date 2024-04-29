//
//  ProductItem.swift
//  Coffe_House
//
//  Created by adyl CEO on 28/04/2024.
//

import Foundation
import UIKit

struct ProductItem: Codable {
    let title: String
    let description: String
    let price: String
    let image: String
    var counter: Int
}

struct MenuData: Codable {
    let products: [ProductItem]
}

//
//  JSONParser.swift
//  Coffe_House
//
//  Created by adyl CEO on 26/04/2024.
//

import Foundation
import UIKit

class JSONParser {
    static func parseProducts(from file: String) -> [MenuItem]? {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            print("File \(file).json not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let menuData = try decoder.decode(MenuData.self, from: data)
            
            let menuItems: [MenuItem] = menuData.products.map { product in
                let image = UIImage(named: product.image)
                return MenuItem(title: product.title, description: product.description, price: product.price, image: image, counter: product.counter)
            }
            return menuItems
        } catch {
            print("Error parsing JSON: \(error.localizedDescription)")
            return nil
        }
    }
}

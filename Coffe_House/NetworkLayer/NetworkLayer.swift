//
//  NetworkLayer.swift
//  Coffe_House
//
//  Created by adyl CEO on 29/04/2024.
//

import Foundation
import SnapKit
import UIKit

class NetworkLayer {
    
    static func fetchCategories(completion: @escaping ([Category]?) -> Void) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching categories:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CategoryResponse.self, from: data)
                completion(response.categories)
            } catch {
                print("Error decoding categories:", error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
    
    static func filterByCategory(category: String, completion: @escaping ([Meal]?) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL:", urlString)
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error filtering meals by category:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(FilterResponse.self, from: data)
                completion(response.meals)
            } catch {
                print("Error decoding filtered meals:", error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
    
    static func fetchMealDetail(id: String, completion: @escaping (MealDetail?) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL:", urlString)
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching meal detail:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MealDetailResponse.self, from: data)
                completion(response.meals.first)
            } catch {
                print("Error decoding meal detail:", error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
    
    static func searchMeal(query: String, completion: @escaping ([Meal]?) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL:", urlString)
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error searching meals:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(FilterResponse.self, from: data)
                completion(response.meals)
            } catch {
                print("Error decoding searched meals:", error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
}

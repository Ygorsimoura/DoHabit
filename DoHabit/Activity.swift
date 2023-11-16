//
//  Activity.swift
//  DoHabit
//
//  Created by Ygor Simoura on 06/11/23.
//

import Foundation
import SwiftUI

struct Activity: Codable, Identifiable {
    var id: UUID
    let title: String
    let description: String
    var days: Int
}

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([Activity].self , from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = [] // caso falhem será um array vazio
    }
}

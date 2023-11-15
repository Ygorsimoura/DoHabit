//
//  Activity.swift
//  DoHabit
//
//  Created by Ygor Simoura on 06/11/23.
//

import Foundation
import SwiftUI

struct Activity: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let days: Int
}

class Activities: ObservableObject {
    @Published var items = [Activity]()
}

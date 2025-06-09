//
//  Activity.swift
//  HabitTracker
//
//  Created by Jacob Walter on 6/9/25.
//

import Foundation

struct Activity: Codable, Identifiable {
    let id: UUID
    let name: String
    var timesCompleted: Int
    
    init(name activityName: String) {
        self.id = UUID()
        self.timesCompleted = 0
        self.name = activityName
    }
}

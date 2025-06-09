//
//  UserActivities.swift
//  HabitTracker
//
//  Created by Jacob Walter on 6/9/25.
//

import Foundation

@Observable
class UserActivities: Codable {
    var activities: [Activity]
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "HabitTrackerActivities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                activities = decodedItems
                return
            }
        }
        
        // Nothing in user defaults
        activities =  []
    }
}

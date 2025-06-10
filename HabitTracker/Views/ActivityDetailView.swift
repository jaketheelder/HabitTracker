//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Jacob Walter on 6/9/25.
//

import SwiftUI

struct ActivityDetail: View {
    @Environment(\.dismiss) var dismiss
    let activityList: UserActivities
    @State private var activityIndex: Int
    
    init(activityList: UserActivities, activityId: UUID) {
        self.activityList = activityList
        guard let activityIndex = activityList.activities.firstIndex(where: {a in a.id == activityId}) else {
            fatalError("Unable to find activity with ID of \(activityId)")
        }
        self.activityIndex = activityIndex
    }
    
    var body: some View {
        Form {
            Section("Description") {
                Text(activityList.activities[activityIndex].description)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
                .listRowBackground(Color(.tertiarySystemFill))
            Section("Record activity") {
                Button("Complete Activity") {
                    activityList.activities[activityIndex].timesCompleted += 1
                    if let encoded = try? JSONEncoder().encode(activityList.activities) {
                        UserDefaults.standard.set(encoded, forKey: "HabitTrackerActivities")
                    } else {
                        fatalError("Unable to encode the activity list")
                    }
                    dismiss()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle(activityList.activities[activityIndex].name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let displayedActivity = Activity(name: "Testing", description: "A test of an activity")
    let testingUserActivities = UserActivities()
    testingUserActivities.activities.append(displayedActivity)
    
    return ActivityDetail(activityList: testingUserActivities, activityId: displayedActivity.id)
}

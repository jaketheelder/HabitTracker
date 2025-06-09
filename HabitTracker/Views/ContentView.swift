//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jacob Walter on 6/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = UserActivities()
    @State private var presentAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.activities) { activity in
                    NavigationLink {
                        ActivityDetail(activityList: activities, activityId: activity.id)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(activity.name)
                                .font(.headline)
                            Text("Times completed: \(activity.timesCompleted)")
                                .font(.caption)
                        }
                    }
                }
            }
            .toolbar {
                Button("Add") {
                    presentAdd = true
                }
            }
            .sheet(isPresented: $presentAdd) {
                AddActivity(activityList: activities)
            }
            .navigationTitle("Habits")
        }
    }
}

#Preview {
    ContentView()
}

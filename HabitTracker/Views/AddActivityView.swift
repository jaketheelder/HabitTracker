//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Jacob Walter on 6/9/25.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.dismiss) var dismiss
    @State private var activityName = ""
    @State private var description = "Activity description..."
    
    var activityList: UserActivities
    
    var body: some View {
        Form{
            Section("Activity Information") {
                TextField("Activity name", text: $activityName)
                TextEditor(text: $description)
                    .frame(minHeight: 100, maxHeight: .infinity)
            }
            Section {
                VStack(alignment: .center) {
                    Button("Create") {
                        if (activityName.isEmpty) {
                            // Do Nothing
                        } else {
                            let newActivity = Activity(name: activityName, description: self.description)
                            activityList.activities.append(newActivity)
                            
                            if let encoded = try? JSONEncoder().encode(activityList.activities) {
                                UserDefaults.standard.set(encoded, forKey: "HabitTrackerActivities")
                            } else {
                                fatalError("Unable to encode the activity list")
                            }
                            
                            dismiss()
                        }
                    }
                        .padding(.bottom)
                        .frame(maxWidth: .infinity)
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var entryError = false
    var emptyActivityList = UserActivities()
    
    return AddActivity(activityList: emptyActivityList)
}

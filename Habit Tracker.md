This is from the challenge described in Paul Hudson's [Day 47](https://www.hackingwithswift.com/guide/ios-swiftui/4/3/challenge) lesson.
## Objective
Track a user defined list of activities to encourage a user to develop new habits.
## Data
### Activity  #MVP
The activity object should be Codable and Identifiable so that it can be stored in [[User Defaults]] and retrieved for use in a UI screen.
#### Properties
- id: UUID (required for Identifiable) #MVP  
- name: String (name of the activity) #MVP  
- description: String (description of the activity)
- icon: String (name of a systemImage to use with the activity)
- requiredAmount: [[#Quantity]] (amount required for completion)
- timesCompleted: Int (times activity has been completed) #MVP 
- goal: ? (how many times does the user want to achieve the goal (per day, per week, etc.))
- history: \[Date: [[#Quantity]]] (list of activity completion)
#### Methods & Computed Properties
- lastPerformed: Date (what was the last time this was performed)
- timesCompleted: Int (replaces the stored property when the history property is completed)
- goalMet: Bool (has the goal for this activity been achieved?)
### Quantity
An object used to track quantities (e.g., number of minutes or pages read)
#### Properties
- value: Numeric (the numeric part of the quantity) (start with Int?)
- unit: String (the name of the attached unit such as minutes)
### Goal Periods
An enum used to define valid time periods for the [[#Goal]] object.  Valid values:
- day = "Day"
- week = "Week"
- month = "Month"
### Goal
An object used to track the number of times a user should do an activity in a given time period.
#### Properties
- times: Int (the number of times a user wants to meet this goal)
- period: [[#Goal Periods]] (the units used for the times property)
#### Methods & Computed Properties
- hasMet(history: \[Date: [[#Quantity]]]) -> Bool (does the provided history meet this goal?)
### User Activities #MVP  
An object to track the aggregation of activities a user has taken.
#### Properties
- user: String (name of the user allowing to track multiple users)
- activities: \[[[#Activity MFV|Activity]]] (list of activities the user is tracking) #MVP 
### Users
Tracks multiple users
## UI
### Main Screen #MVP 
Show a [[Lists|List]] of activities the user is tracking and associated information from the [[#Activity MVP|Activity]] object.
### Add Activity Screen #MVP 
Get information on a new activity from the user.  All properties except for those used in activity tracking (e.g., timesCompleted) should be provided.
### Activity Screen #MVP 
Shows details on the activity and allows the user to mark the activity as completed
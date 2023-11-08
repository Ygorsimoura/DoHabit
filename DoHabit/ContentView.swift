//
//  ContentView.swift
//  DoHabit
//
//  Created by Ygor Simoura on 06/11/23.
//

import SwiftUI



struct ContentView: View {
    @StateObject var activities = Activities()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(activities.items) { activity in
                    Text(activity.title)
                }
            }
            .navigationBarTitle("Do Habit", displayMode: .inline) 
            .toolbar{
                Button{
                    let newActivity = Activity(id: UUID(), title: "Test", description: "Test")
                    activities.items.append(newActivity)
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

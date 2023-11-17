//
//  ContentView.swift
//  DoHabit
//
//  Created by Ygor Simoura on 06/11/23.
//

import SwiftUI
struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingSheet = false
    var body: some View {
        NavigationStack{
            List{
                ForEach(activities.items) { activity in
                    HStack {
                        NavigationLink(destination: HabitView( activity: activity)){
                            VStack(alignment: .leading) {
                                Text(activity.title)
                                    .font(.headline)
                                
                                Text(activity.description)
                                    .font(.caption)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -10))
                            }
                            Spacer()
                            HStack {
                            Spacer()
                                Text("\(activity.days)")
                                    .font(.system(size: 20))
                                    .fontDesign(.rounded)
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                                Image(systemName: "flame.fill")
                                    .font(.system(size: 18))
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                    }
                }
                .onDelete(perform: removeIntems)
                
            }
            .navigationBarTitle("Do Habit", displayMode: .inline) 
            .toolbar{
                Button{
                    showingSheet.toggle()
                } label: {
                    Label("Add", systemImage: "plus.circle")
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $showingSheet){
                    AddView(activities : activities)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    func removeIntems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

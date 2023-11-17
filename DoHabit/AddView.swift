//
//  AddView.swift
//  DoHabit
//
//  Created by Ygor Simoura on 09/11/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var days = ""
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            VStack{
                    Form{
                        Section(header: Text("Tell me more about your new habit").textCase(nil).foregroundColor(.white).font(.system(size: 15))){
                            TextField("Habit name", text: $name)
                            TextField("Description", text: $description)
                                .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                            TextField("How long you had this habit?", text: $days)
                                .keyboardType(.numberPad)
                        }
                    }
                    .padding()
                    
                    
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(width: 320, height: 300)
                            .foregroundColor(.gray)
                            .opacity(0.20)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Section{
                            
                            VStack {
                                Text("The importance of recurring habits")
                                    .foregroundColor(.gray)
                                    .font(.system(size:15))
                                    .fontWeight(.bold)
                                 
                                HStack {
                                    Text("60")
                                        .foregroundColor(.red)
                                        .font(.system(size: 90))
                                        .fontDesign(.rounded)
                                        .fontWeight(.black)
                                    
                                    Image(systemName: "flame")
                                        .font(.system(size: 60))
                                        .foregroundColor(.red)
                                    
                                }
                                
                                
                                Text("Daily habits bring significant life benefits. Beyond building discipline, they enhance skills, boost emotional well-being, and create a solid foundation for personal success. This consistency strengthens self-development and streamlines achieving long-term goals effectively and satisfyingly.")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                    .padding(EdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 70))
                                   
                            }
                        }
                    }
                    .padding(EdgeInsets(top: -440, leading: 0, bottom: 0, trailing: 0))
                }
                .preferredColorScheme(.dark)
                .navigationTitle("Your habit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    Button("Save"){
                        let newHabit = Activity(id: UUID(), title: name, description: description, days: Int(days) ?? 1)
                        activities.items.append(newHabit)
                        
                        dismiss()
                    }
                    .foregroundColor(.white)
            }
        }

    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}

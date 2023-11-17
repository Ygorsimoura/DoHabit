//
//  HabitView.swift
//  DoHabit
//
//  Created by Ygor Simoura on 14/11/23.
//

import SwiftUI

struct HabitView: View {
    @State var activity: Activity
    var body: some View {
        NavigationStack {
            VStack(spacing:50){
                    HStack{
                        Text(activity.description)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 35))
                    ZStack {
                    Rectangle()
                                .frame(width: 320, height: 250)
                                .foregroundColor(.gray)
                                .opacity(0.20)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack(spacing: 6){
                            HStack {
                                Text("\(activity.days)")
                                    .foregroundColor(.red)
                                    .font(.system(size: 100))
                                    .fontDesign(.rounded)
                                    .fontWeight(.black)
                                Image(systemName: "flame")
                                    .font(.system(size: 70))
                                    .foregroundColor(.red)
                            }
                            Button{
                                activity.days += 1
                            } label: {
                                Label("Add Day", systemImage: "plus")
                                    .font(.system(size: 22))
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color(red: 0.11, green: 0.11, blue: 0.11))
                                    .padding(EdgeInsets(top: 13, leading: 55, bottom: 13, trailing: 55))
                            }
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    Spacer()
                }
            .navigationTitle(activity.title)
                .navigationBarTitleDisplayMode(.large)
        }
        .preferredColorScheme(.dark)
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        if let sampleActivity = Activities().items.first {
            HabitView(activity: sampleActivity)
        } else {
            Text("No activities available")
        }
    }
}

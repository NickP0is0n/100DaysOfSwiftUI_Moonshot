//
//  ContentView.swift
//  Moonshot
//
//  Created by Mykola Chaikovskyi on 16.09.2024.
//

import SwiftUI

struct MissionGrid: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let missions: [Mission]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.gray)

                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct MissionList: View {
    let missions: [Mission]
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.gray)

                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showAsList = false

    var body: some View {
        NavigationStack {
            ScrollView {
                if showAsList {
                    MissionList(missions: missions)
                } else {
                    MissionGrid(missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(showAsList ? "Display as grid" : "Display as list") {
                    showAsList.toggle()
                }
            }
            .navigationDestination(for: Mission.self) { selection in
                MissionView(mission: selection, astronauts: astronauts)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

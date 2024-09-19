//
//  MissionView.swift
//  Moonshot
//
//  Created by Mykola Chaikovskyi on 20.09.2024.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200 )
                 
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description )
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        let mission: [Mission] = Bundle.main.decode("missions.json")
        
        MissionView(mission: mission[0])
            .preferredColorScheme(.dark)
    }
}

//
//  ContentView.swift
//  Moonshot
//
//  Created by Mykola Chaikovskyi on 16.09.2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("Detailed View")
            } label: {
                VStack {
                    Text("This is a label")
                    Text("This is also a label")
                    Image("aesthetic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

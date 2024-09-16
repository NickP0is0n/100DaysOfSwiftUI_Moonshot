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
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Details about row \(row)")
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

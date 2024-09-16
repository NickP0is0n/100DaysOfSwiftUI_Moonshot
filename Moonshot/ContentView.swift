//
//  ContentView.swift
//  Moonshot
//
//  Created by Mykola Chaikovskyi on 16.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("aesthetic")
            .frame(width: 200, height: 200)
            .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

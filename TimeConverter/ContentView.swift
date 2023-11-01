//
//  ContentView.swift
//  TimeConverter
//
//  Created by Денис Денисов on 31.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section("1 section") {
                ForEach(0..<10) {
                    Text("\($0)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

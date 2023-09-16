//
//  ContentView.swift
//  ScrollSampler
//
//  Created by robin tetley on 16/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<100) { i in
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 100)
                        .scrollTransition { content, phase in
                            content
                                .blur(radius: phase == .identity ? 0 : 50)
                                .hueRotation(.degrees(90 * phase.value))
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

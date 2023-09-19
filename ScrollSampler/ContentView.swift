//
//  ContentView.swift
//  ScrollSampler
//
//  Created by robin tetley on 16/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dataModel = DataModel()
    
    var body: some View {
        NavigationSplitView {
            Form {
                ForEach(dataModel.variants) { variant in
                    //you'll hoit the need for the below a lot in swiftui. 'Take the curretn object, wrap it inside the Bindable struct that knows how to read and write observable data and use that to bind to below.
                    @Bindable var variant = variant
                    Section(variant.id) {
                        LabeledContent("Opacity") {
                            Slider(value: $variant.opacity, in: 0...1)
                        }
                    }
                    
                }
                
            }
            .toolbar(.hidden)
        } detail: {
            ScrollView {
                VStack {
                    ForEach(0..<100) { i in
                        Rectangle()
                            .fill(.blue)
                            .frame(height: 100)
                            .scrollTransition { content, phase in
                                content
                                    //clever method to call using keypaths
                                    .opacity(dataModel(\.opacity, for: phase))
                            }
                    }
                }
                .padding()
            }
            .toolbar(.hidden)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}

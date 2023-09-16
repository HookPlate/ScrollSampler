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
                //the sliders in ios like not having titles, hence the use of the below.
                LabeledContent("Opacity") {
                    Slider(value: $dataModel.opacity, in: 0...1)
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
                                    
                                    .opacity(dataModel.opacity)
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

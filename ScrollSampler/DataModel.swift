//
//  DataModel.swift
//  ScrollSampler
//
//  Created by robin tetley on 16/09/2023.
//
//import Observation
import Foundation
import SwiftUI

@Observable
class DataModel {
    var topLeading = TransitionVariant(id: "Top Leading")
    var bottomTrailing = TransitionVariant(id: "Bottom Trailing")
    var identity = TransitionVariant(id: "Identity")
    
    var variants : [TransitionVariant] {
        [topLeading, identity, bottomTrailing]
    }
    // maps the passed in ScrollTransition to the correct thing. An imperfect solution but it keeps us moving for now. When we add way more visual effects this becomes a hassle to write one for each effect (xoffest, blur, saturation etc..)
//    func opacity(for phase: ScrollTransitionPhase) -> Double {
//        switch phase {
//        case .topLeading:
//            topLeading.opacity
//        case .bottomTrailing:
//            bottomTrailing.opacity
//        default:
//            identity.opacity
//        }
//    }
    
    // the new agnostic method that deals with all TransitionVariant Keypaths. Keypaths are one of his favourite features of Swift, reall great way of dealing with uninvoked members: 'Don't give me the actual value inside the String, refer to that property itself, by naame and get the property that way.'
    func get(_ keypath: KeyPath<TransitionVariant, Double>, for phase: ScrollTransitionPhase) -> Double {
        switch phase {
        case .topLeading:
            //if they've asked for opacity, read that, if they've asked for blur, read that. If you go look at the call site in content view you'll see how we ask for each visual effect.
            topLeading[keyPath: keypath]
        case .identity:
            identity[keyPath: keypath]
        case .bottomTrailing:
            bottomTrailing[keyPath: keypath]
        }
    }
    
    
}

@Observable
class TransitionVariant: Identifiable {
    var id: String
    var opacity = 1.0
    
    init(id: String) {
        self.id = id
    }
}

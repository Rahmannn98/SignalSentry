//
//  BrefingView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//
import SwiftUI

struct BriefingView: View {
    let mission: Mission
    var onNext: () -> Void
    
    var body: some View {
        VStack {
            Text("Briefing: \(mission.name)")
                .font(.title).foregroundColor(.white)
            
            Button("Next") {
                onNext() 
            }
            Text("Briefing: \(mission.name)")
                .font(.title).foregroundColor(.white)
            
            Button("Next") {
                onNext()
            }
            Text("Briefing: \(mission.name)")
                .font(.title).foregroundColor(.white)
            
            Button("Next") {
                onNext()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

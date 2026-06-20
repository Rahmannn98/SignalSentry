//
//  GameplayView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI

struct GameplayContainerView: View {
    let mission: Mission
    @State var currentPhase: GamePhase = .briefing
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            switch currentPhase {
            case .briefing:
                BriefingView(mission: mission, onNext: { currentPhase = .receiving })
            case .receiving:
                ReceivingView(onNext: { currentPhase = .memory })
            case .memory:
                MemoryView(onNext: { currentPhase = .transmit })
            case .transmit:
                TransmitView(onNext: { currentPhase = .validate })
            case .validate:
                ResultView(onNext: {
                    
                    dismiss()
                })
            }
        }
        .navigationBarHidden(true)
    }
}


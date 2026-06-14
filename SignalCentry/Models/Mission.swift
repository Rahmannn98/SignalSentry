//
//  Mission.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import Foundation
import SwiftUI


enum MissionStatus {
    case completed // Centang biru
    case active    // Play hijau (Bisa dipilih)
    case locked    // Gembok abu-abu
}

struct Mission: Identifiable {
    let id = UUID()
    let name: String
    let sector: String
    let difficulty: String
    let difficultyColor: Color
    let status: MissionStatus
    
    
    let totalSignals: Int
    let accuracy: Int
    let progress: Double
    
    let completedMissionCount: Int
    let bestAccuracy: Int
    let bestStreak: Int
    let meteorsDefeated: Int
    
}

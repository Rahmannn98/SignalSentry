//
//  DashboardViewModels.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 14/06/26.
//
import SwiftUI
import Foundation
import Combine


class DashboardViewModels: ObservableObject {
    @Published var availableMissions: [Mission] = [
        Mission(
                    name: "Taruma Space",
                    sector: "Sector 1",
                    difficulty: "EASY",
                    difficultyColor: .blue, status: .completed,
                    totalSignals: 50,
                    accuracy: 20,
                    progress: 0.68,
                    completedMissionCount: 12,
                    bestAccuracy: 100,
                    bestStreak: 10,
                    meteorsDefeated: 50
                ),
                Mission(
                    name: "Guntur Space",
                    sector: "Sector 2",
                    difficulty: "MEDIUM",
                    difficultyColor: .yellow, status: .active,
                    totalSignals: 100,
                    accuracy: 30,
                    progress: 0.42,
                    completedMissionCount: 15,
                    bestAccuracy: 100,
                    bestStreak: 15,
                    meteorsDefeated: 100
                ),
                Mission(
                    name: "Cave Space",
                    sector: "Sector 3",
                    difficulty: "HARD",
                    difficultyColor: .red, status: .locked,
                    totalSignals: 212,
                    accuracy: 88,
                    progress: 0.42,
                    completedMissionCount: 5,
                    bestAccuracy: 91,
                    bestStreak: 12,
                    meteorsDefeated: 432
                ),
                Mission(
                    name: "Papandayan Space",
                    sector: "Sector 4",
                    difficulty: "EASY",
                    difficultyColor: .blue, status:.locked,
                    totalSignals: 212,
                    accuracy: 88,
                    progress:0.42,
                    completedMissionCount: 5,
                    bestAccuracy: 91,
                    bestStreak: 12,
                    meteorsDefeated: 432
                ),
                Mission(
                    name: "Malabar Space",
                    sector: "Sector 5",
                    difficulty: "MEDIUM",
                    difficultyColor: .yellow, status:.locked,
                    totalSignals: 212,
                    accuracy: 88,
                    progress: 0.42,
                    completedMissionCount: 5,
                    bestAccuracy: 91,
                    bestStreak: 12,
                    meteorsDefeated: 432
                ),

        
            ]
    @Published var currentMissionIndex: Int = 0
    var currentMission: Mission {
            availableMissions[currentMissionIndex]
        }
}

//
//  DashboardView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI

struct DashboardView: View {
    var glassStyle: Glass = .regular
    @StateObject private var viewModel = DashboardViewModels()

    private let gridColoms = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
    ]

    var body: some View {
        let activeMission = viewModel.currentMission

        ZStack {

            HeroOrbitView()
                .opacity(0.9)
                .offset(y: -200)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 24) {

                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Signal Centry")
                                .font(.system(.largeTitle, design: .rounded))
                                .bold()
                                .foregroundColor(.primary)
                            Text("Earth Defens Network")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.secondary)
                        }
                        Spacer()

                        Button(action: {
                            withAnimation(
                                .spring(response: 0.4, dampingFraction: 0.7)
                            ) {
                                viewModel.currentMissionIndex =
                                    (viewModel.currentMissionIndex + 1)
                                    % viewModel.availableMissions.count
                            }
                        }) {
                            Text("GANTI MISI")
                                .font(.caption2).bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(
                                    Color.blue.opacity(0.3),
                                    in: Capsule()
                                )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                    Color.clear.frame(height: 140)

                    MissionSummaryCardView(mission: activeMission)
                        .padding(.horizontal, 16)

                    LazyVGrid(columns: gridColoms, spacing: 12) {
                        DashboardStartCard(
                            icon: "globe",
                            iconColor: .green,
                            value: "\(activeMission.completedMissionCount)",
                            title: "MISSIONS"
                        )
                        DashboardStartCard(
                            icon: "scope",
                            iconColor: .cyan,
                            value: "\(activeMission.bestAccuracy)%",
                            title: "BEST ACC."
                        )
                        DashboardStartCard(
                            icon: "flame.fill",
                            iconColor: .orange,
                            value: "×\(activeMission.bestStreak)",
                            title: "BEST STREAK"
                        )
                        DashboardStartCard(
                            icon: "shield.fill",
                            iconColor: .purple,
                            value: "\(activeMission.meteorsDefeated)",
                            title: "METEORS"
                        )
                    }
                    .padding(.horizontal, 16)

                    Button(action: {
                        print("Memulai misi: \(activeMission.name)")
                    }) {

                    }
                }
                .padding(.bottom, 30)

                VStack {
                    Button(action: {
                        print("Memulai misi: \(activeMission.name)")
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "play.fill")
                                .font(.system(size: 16, weight: .bold))

                            Text("Start")
                                .font(
                                    .system(
                                        size: 18,
                                        weight: .bold,
                                        design: .rounded
                                    )
                                )
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)

                        .background(Color.blue, in: Capsule())

                        .shadow(
                            color: Color.blue.opacity(0.35),
                            radius: 12,
                            x: 0,
                            y: 6
                        )
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                }
            }
        }
    }
}

#Preview {
    DashboardView()
        .preferredColorScheme(.dark)
}

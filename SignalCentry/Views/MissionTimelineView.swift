//
//  MissionTimelineView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

//
//  MissionTimelineView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 14/06/26.
//

import SwiftUI

struct MissionTimelineView: View {
    private var glassStyle: Glass = .regular
    private var selectedTint: Color = .clear
    private var cornerRadius: CGFloat = 16.0
    private var isInteractive: Bool = false

    @StateObject private var viewModel = DashboardViewModels()

    var body: some View {
        NavigationStack {
            ZStack {

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 8) {

                        Text("SIGNAL OPERATOR")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.cyan)
                            .tracking(1.5)
                            .padding(.horizontal, 24)
                            .padding(.top, 20)

                        Text("Mission Timeline")
                            .font(
                                .system(
                                    size: 32,
                                    weight: .bold,
                                    design: .rounded
                                )
                            )
                            .foregroundColor(.primary)
                            .padding(.horizontal, 24)

                        VStack(spacing: 0) {
                            ForEach(viewModel.availableMissions) { mission in
                                HStack(alignment: .top, spacing: 16) {

                                    VStack(spacing: 0) {
                                        statusIndicatorIcon(for: mission.status)

                                        if mission.id
                                            != viewModel.availableMissions.last?
                                            .id
                                        {
                                            Rectangle()
                                                .fill(
                                                    mission.status == .completed
                                                        ? Color.cyan.opacity(
                                                            0.5
                                                        )
                                                        : Color.gray.opacity(
                                                            0.2
                                                        )
                                                )
                                                .frame(width: 2, height: 70)
                                        }
                                    }
                                    .frame(width: 40)

                                    if mission.status == .locked {

                                        missionCardRow(for: mission)
                                            .opacity(0.4)
                                    } else {

                                        NavigationLink(
                                            destination: GameplayContainerView(
                                                mission: mission
                                            )
                                        ) {
                                            missionCardRow(for: mission)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding(.horizontal, 24)
                            }
                        }
                        .padding(.top, 30)
                    }
                    .padding(.bottom, 40)
                }
            }
        }
    }

    private func missionCardRow(for mission: Mission) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(mission.sector.uppercased())
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.secondary)
                    .tracking(1)

                Spacer()

                if mission.status == .active {
                    Text("ACTIVE")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.green)
                        .tracking(1)
                }
            }

            Text(mission.name)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.primary)

            Text("Learn and secure transmission signals.")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)

        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.clear)
                .glassEffect(
                    glassStyle.tint(selectedTint).interactive(isInteractive),
                    in: .rect(cornerRadius: cornerRadius)
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    mission.status == .active
                        ? Color.green.opacity(0.3) : Color.white.opacity(0.08),
                    lineWidth: 1
                )
        )
    }

    @ViewBuilder
    private func statusIndicatorIcon(for status: MissionStatus) -> some View {
        switch status {
        case .completed:

            ZStack {
                Circle().stroke(Color.cyan, lineWidth: 2).frame(
                    width: 36,
                    height: 36
                )
                Image(systemName: "checkmark").font(
                    .system(size: 14, weight: .bold)
                ).foregroundColor(.cyan)
            }
        case .active:

            ZStack {
                Circle().fill(Color.green.opacity(0.1)).frame(
                    width: 36,
                    height: 36
                )
                Circle().stroke(Color.green, lineWidth: 2).frame(
                    width: 36,
                    height: 36
                )
                Image(systemName: "play.fill").font(.system(size: 12))
                    .foregroundColor(.green)
            }
            .shadow(color: .green.opacity(0.4), radius: 6)
        case .locked:

            ZStack {
                Circle().stroke(Color.gray.opacity(0.3), lineWidth: 2).frame(
                    width: 36,
                    height: 36
                )
                Image(systemName: "lock.fill").font(.system(size: 12))
                    .foregroundColor(.gray.opacity(0.5))
            }
        }
    }
}

#Preview {
    MissionTimelineView()
        .preferredColorScheme(.dark)
}

//
//  CardMision.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI
struct MissionSummaryCardView: View {
    private let progressValue: Double = 0.68
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("CURRENT MISSION")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Sector 7 · Orbit Defense")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                Spacer()
                DifficultyBadge(level: "MEDIUM", color: .orange)
            }

            HStack(spacing: 20) {
                MetricView(title: "TARGETS", value: "248", valueColor: .cyan)
                Divider().frame(height: 28).background(.secondary)
                MetricView(title: "ACCURACY", value: "94%",valueColor: .green)
                Divider().frame(height: 28).background(.secondary)
                MetricView(title: "PROGRESS", value: "68%", valueColor: .purple)
            }
            ProgressView(value:progressValue, total: 1.0)
                .progressViewStyle(.linear)
                .tint(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.cyan, Color.green.opacity(0.3)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .scaleEffect(x:1, y: 2, anchor: .center)
        }
        .glassCardStyle()
        .padding()
    }
}

struct DifficultyBadge: View {
    let level: String
    let color: Color
    var body: some View {
        Text(level)
            .font(.caption2.weight(.bold))
            .foregroundColor(color)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                Capsule().fill(color.opacity(0.15))
                    .overlay(
                        Capsule().stroke(color.opacity(0.5),lineWidth: 1))
            )
    }
}
struct MetricView: View {
    let title: String
    let value: String
    let valueColor: Color
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.caption2)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title3)
                .bold()
                .foregroundColor(valueColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
#Preview {
    MissionSummaryCardView()
}

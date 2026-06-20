//
//  StartDashboardCard.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 14/06/26.
//
import SwiftUI
struct DashboardStartCard : View {
    var glassStyle: Glass = .regular
    var selectedTint: Color = .clear
    var cornerRadius: CGFloat = 16.0
    var isInteractive: Bool = false
    let icon: String
    let iconColor: Color
    let value: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(iconColor)
                .frame(width: 32, height: 32)
                .background(iconColor.opacity(0.15))
                .clipShape(Circle())
                .overlay(Circle().stroke(iconColor.opacity(0.3), lineWidth: 0.5))
            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.primary)
                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 14)
        .background {
            ZStack {
              
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.ultraThinMaterial)

                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.clear)
                    .glassEffect(
                        glassStyle.tint(selectedTint).interactive(isInteractive),
                        in: .rect(cornerRadius: cornerRadius)
                    )
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 14)
                .stroke(.white.opacity(0.12), lineWidth: 0.5)
        }
    }
}

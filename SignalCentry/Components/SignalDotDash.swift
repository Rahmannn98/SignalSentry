//
//  SignalDotDash.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI

struct SignalDotDashView: View {

    let signals: [SignalType]

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<signals.count, id: \.self) { index in
                let signal = signals[index]

                Capsule()
                    .fill(Color.cyan)

                    .frame(width: signal == .dot ? 14 : 38, height: 14)

                    .shadow(color: .cyan.opacity(0.8), radius: 6, x: 0, y: 0)

                    .transition(.scale.combined(with: .opacity))
            }
        }

        .animation(
            .spring(response: 0.3, dampingFraction: 0.6),
            value: signals.count
        )
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        VStack(spacing: 40) {
            Text("PREVIEW TRANSMISSION")
                .foregroundColor(.white)
                .font(.caption)

            SignalDotDashView(signals: [.dot, .dot, .dash, .dot, .dot, .dot])
        }
    }
}

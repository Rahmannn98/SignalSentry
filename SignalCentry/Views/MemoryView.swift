//
//  MemoryView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 14/06/26.
//

import SwiftUI

struct MemoryView : View {
    var glassStyle: Glass = .regular
    var onNext: () -> Void
    @State private var countdown = 3

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Text("Memory Lock")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.green)
                    .tracking(1.5)

                Text("PHASE 02 OF 03")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.secondary)

                Text("Memorize the Pattern")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Text("Hold the rhythm in mind. You will transmit it next.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Spacer()
                Button(action: {
                    onNext()
                }) {

                    Button("Ready to Trasnmit") {
                        // Button Action
                    }.buttonStyle(.glass(glassStyle))
                    .controlSize(.regular)
                    .buttonBorderShape(.automatic)
                }
                .padding(.horizontal,24)
                .padding(.bottom,16)
            }
        }
    }
}

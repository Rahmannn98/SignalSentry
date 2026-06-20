//
//  MemoryView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 14/06/26.
//

import SwiftUI

struct MemoryView: View {
    var onNext: () -> Void
    @State private var countdown = 3

    var body: some View {
        ZStack {
            Text("\(countdown)")
                .font(.system(size: 140, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.blue, Color.purple.opacity(0.8)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: Color.blue.opacity(0.5), radius: 25)
                .transition(.scale.combined(with: .opacity))
                .id(countdown)
        }
        .onAppear {
            startIntroCountdown()
        }
    }
    
    private func startIntroCountdown() {
        Task {
            // 1. Loop hitung mundur dari 3 menuju 1
            while countdown > 1 {
                try? await Task.sleep(nanoseconds: 1_000_000_000) // Jeda tepat 1 detik
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                    countdown -= 1
                }
            }
            
            // 2. Tahan angka 1 selama 1 detik terakhir sebelum melompat
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            
            // 3. 🚀 OTOMATIS MASUK GAMEPLAY (Picu onNext di Main Thread)
            await MainActor.run {
                withAnimation(.easeInOut(duration: 0.4)) {
                    onNext()
                }
            }
        }
    }
}

// --- PREVIEW KANVAS XCODE ---
#Preview {
    MemoryView(onNext: { print("Otomatis masuk ke TransmitView!") })
        .preferredColorScheme(.dark)
}

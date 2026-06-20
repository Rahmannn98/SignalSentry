//
//  ResultView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI

struct ResultView: View {
    var onNext: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 28) {
                Text("• SIGNAL VALIDATION •")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.cyan)
                    .tracking(1.5)
                
                Text("CROSS-CHECK • PATTERN SYNC")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.secondary)
                
                Text("Pattern Match")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                // Cincin Keberhasilan Hijau Bercentang
                ZStack {
                    Circle()
                        .fill(Color.green.opacity(0.15))
                        .frame(width: 140, height: 140)
                        .blur(radius: 10)
                    
                    Circle()
                        .stroke(Color.green, lineWidth: 3)
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "check")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 6) {
                    Text("100%")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.green)
                    Text("SYNC ACCURACY")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Tombol Kembali ke Timeline Akhir Misi
                Button(action: {
                    onNext()
                }) {
                    Text("Confirm Result")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(Color.blue, in: Capsule())
                        .shadow(color: Color.blue.opacity(0.4), radius: 12, x: 0, y: 6)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }
            .padding(.top, 40)
        }
    }
}

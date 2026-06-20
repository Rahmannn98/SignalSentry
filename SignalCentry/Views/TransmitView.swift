//
//  TransmitView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 14/06/26.
//

import SwiftUI

struct TransmitView: View {
    var onNext: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 24) {
                HStack {
                    HStack(spacing: 6) {
                        Image(systemName: "heart.fill").foregroundColor(.red)
                        Image(systemName: "heart.fill").foregroundColor(.red)
                        Image(systemName: "heart.fill").foregroundColor(.red)
                    }
                    Spacer()
                    Text("9")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.cyan)
                        .padding(8)
                        .background(Circle().stroke(Color.cyan, lineWidth: 2))
                }
                .padding(.horizontal, 24)
                
                Text("Send the Signal")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text("Tap for dot - Hold for dash • Match the rhythm")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                
         
                HStack(spacing: 8) {
                    Circle().fill(Color.cyan).frame(width: 8, height: 8)
                    Circle().fill(Color.cyan).frame(width: 8, height: 8)
                    Capsule().fill(Color.cyan).frame(width: 20, height: 8)
                    Circle().fill(Color.cyan).frame(width: 8, height: 8)
                }
            
                VStack(alignment: .leading, spacing: 8) {
                    Text("YOUR TRANSMISSION")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.secondary)
                    
                    Text("Awaiting input...")
                        .font(.system(size: 14, design: .monospaced))
                        .foregroundColor(.cyan.opacity(0.6))
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.white.opacity(0.05))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
                .padding(.horizontal, 24)
                
                Spacer()
        
                ZStack {
                    Circle().stroke(Color.cyan.opacity(0.15), lineWidth: 1).frame(width: 240, height: 240)
                    Circle().stroke(Color.cyan.opacity(0.3), lineWidth: 1).frame(width: 180, height: 180)
                    Circle().fill(Color.cyan.opacity(0.8)).frame(width: 80, height: 80)
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button(action: {
                    onNext()
                }) {
                    Text("Capture Signal")
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
            .padding(.top, 20)
        }
    }
}

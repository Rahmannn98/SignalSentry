
//
//  RadarCirclevIEW.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//
import SwiftUI

struct HeroOrbitView: View{
    @State private var rotate = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(.blue.opacity(0.5),lineWidth: 1)
                .frame(width: 220, height: 220)
                .blur(radius: 0.5)
            Circle()
                .fill(LinearGradient(colors:[.cyan, .blue],
                      startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 140, height: 140)
                .shadow(color: .cyan.opacity(0.2), radius: 30)
            Circle()
                .stroke(Color.cyan.opacity(0.5),lineWidth: 2)
                .frame(width: 180, height: 180)
                .rotationEffect(.degrees(rotate ? 360:0))
                .animation(.linear(duration: 12).repeatForever(autoreverses: false),value: rotate)
            HStack  {
                Image(systemName: "globe.asia.australia.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.0, green: 0.7, blue: 0.1),
                                        .green
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomLeading
                                )
                            )
                    .rotationEffect(.degrees(rotate ?  360 : 0 ))
                    .animation(
                        .linear(duration: 10).repeatForever(autoreverses: false),value: rotate
                    )
            }
        }
        .onAppear {rotate = true}
        .padding(.vertical, 10)
    }
}
#Preview {
    HeroOrbitView()
}

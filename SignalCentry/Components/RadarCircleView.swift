
//
//  RadarCirclevIEW.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//
import SwiftUI
import SceneKit

struct HeroOrbitView: View{
    @State private var rotate = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.cyan.opacity(0.01),lineWidth: 2)
                .frame(width: 250, height: 220)
                .rotationEffect(.degrees(rotate ? 360:0))
                .animation(.linear(duration: 12).repeatForever(autoreverses: false),value: rotate)
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 290, height: 290)
                    .blur(radius: 20)
                SceneView(
                    scene: makeEarthScene(),
                    options: [
                        .allowsCameraControl,
                        .autoenablesDefaultLighting
                    ]
                )
                .frame(width: 200, height: 280)
                .clipShape(Circle())
            }
        }
        .onAppear {rotate = true}
        .padding(.vertical, 10)
    }
    private func makeEarthScene()->SCNScene{
        guard let scene = SCNScene(named: "earth.usdz")else{
            return SCNScene()
        }
        let earthNode = scene.rootNode
            
                let rotateAction = SCNAction.rotateBy(
                    x: 0,
                    y: CGFloat(Double.pi * 2),
                    z: 0,
                    duration: 30
                )
                let repeatForever = SCNAction.repeatForever(rotateAction)
                
                earthNode.runAction(repeatForever)
        
                scene.background.contents = Color.clear
                
                return scene
    }
}
#Preview {
    HeroOrbitView()
}

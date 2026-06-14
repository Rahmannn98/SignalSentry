//
//  RecivingView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 14/06/26.
//

import SwiftUI

struct ReceivingView : View {
    var onNext: () -> Void
        
        var body: some View {
            ZStack {
                VStack(spacing: 20) {
                    Text("Receiving Signal...")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        onNext() 
                    }) {
                        Text("READY TO TRANSMIT")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green.opacity(0.3), in: Capsule())
                    }
                }
            }
        }
}
#Preview {
    ReceivingView(onNext: {})
}



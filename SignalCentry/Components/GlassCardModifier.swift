//
//  CardView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI
struct GlassCardModifier: ViewModifier {
    @Environment(\.colorSchemeContrast) var contrast
    
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(contrast == .increased ? Color.black : Color.white)
            .background {
                if contrast != .increased {
                    AnyView(Color.spaceDark.opacity(0.1))
                }else{
                    AnyView(EmptyView())
                    }
                }
            .background {
                if contrast != .increased {
                    AnyView(Rectangle().fill(.ultraThinMaterial))
                } else {
                    AnyView(EmptyView())
                }
            }
            .cornerRadius(8)
            }
        }

    


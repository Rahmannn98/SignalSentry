//
//  CardView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI
struct GlassCardModifier: ViewModifier {
    @Environment(\.colorSchemeContrast) var contrast
    @Environment(\.colorScheme) var colorScheme
    
    var cornerRadius: CGFloat = 16
    var isCapsule: Bool = false
    
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background {
                if contrast == .increased {
                    colorScheme == .dark ? Color.black : Color.white
                 }else{
                     if isCapsule {
                         Rectangle().fill(.ultraThinMaterial).clipShape(Capsule())
                     }
                     else {
                         RoundedRectangle(cornerRadius: cornerRadius).fill(.ultraThinMaterial)
                     }
                }
            }
            .overlay {
                Group {
                    if isCapsule {
                        Capsule()
                            .stroke(
                                colorScheme == .dark ? Color.white.opacity(0.08) : Color.black.opacity(0.3), lineWidth: contrast == .increased ? 2 : 0.5
                            )
                    } else {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(
                                    colorScheme == .dark ? Color.white.opacity(0.19) : Color.black.opacity(0.16),lineWidth: contrast == .increased ? 2 : 0.5
                            )
                        
                    }
                }
            }
            .cornerRadius(8)
            }
        }
extension View {
    func glassCardStyle(cornerRadius: CGFloat = 16, isCapsule: Bool = false) -> some View {
        self.modifier(GlassCardModifier(cornerRadius: cornerRadius, isCapsule: isCapsule))
    }
}

    


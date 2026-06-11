//
//  DashboardView.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI
struct DashboardView : View {
    var body: some View {
        VStack {
            Text("Dashboard")
                .font(Font.largeTitle)
            Text("This is the dashboard view")
        }
        .padding(16)
    }
}
#Preview {
      VStack {
          DashboardView()
          Text("Glass Card")
              .modifier(GlassCardModifier())
      }
  }

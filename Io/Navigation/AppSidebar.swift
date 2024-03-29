//
//  AppSidebar.swift
//  Io
//
//  Created by Carson Gross on 3/29/24.
//

import SwiftUI

struct AppSidebar: View {
    @Environment(Navigator.self) private var navigator
    
    var body: some View {
        @Bindable var navigator = navigator
        List(selection: $navigator.selectedScreen) {
            ForEach(AppScreen.allCases) { screen in
                NavigationLink(value: screen) {
                    screen.label
                }
            }
        }
    }
}

#Preview {
    AppSidebar()
        .environment(Navigator.shared)
}

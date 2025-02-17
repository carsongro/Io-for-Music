//
//  ContentView.swift
//  Io
//
//  Created by Carson Gross on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigator = Navigator.shared
    
    var body: some View {
        if navigator.isWelcomeViewPresented {
            WelcomeView(musicAuthorizationStatus: $navigator.musicAuthorizationStatus)
        } else {
            VStack {
                NavigationSplitView {
                    AppSidebar()
                        .navigationSplitViewColumnWidth(ideal: 250, max: 500)
                } detail: {
                    AppDetailColumn(screen: navigator.selectedScreen)
                }
                
                PlayerView()
            }
            .environment(navigator)
            .environment(MusicLibraryManager.shared)
        }
    }
}

#Preview {
    ContentView()
}

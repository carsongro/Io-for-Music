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
        VStack {
            NavigationSplitView {
                AppSidebar()
            } detail: {
                AppDetailColumn()
            }
            
            PlayerView()
        }
        .environment(navigator)
    }
}

#Preview {
    ContentView()
}

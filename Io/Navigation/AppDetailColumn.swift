//
//  AppDetailColumn.swift
//  Io
//
//  Created by Carson Gross on 3/29/24.
//

import SwiftUI

struct AppDetailColumn: View {
    @Environment(Navigator.self) private var navigator
    
    var body: some View {
        if let screen = navigator.selectedScreen {
            screen.destination
        } else if let playlist = navigator.selectedPlaylist {
            PlaylistDetailView(playlist: playlist)
        } else {
            ContentUnavailableView {
                Label("Browse Music", image: "music.note")
            } actions: {
                Button("Browse") {
                    navigator.selectedScreen = .home
                }
            }
        }
    }
}

#Preview {
    AppDetailColumn()
        .environment(Navigator.shared)
}

//
//  PlaylistRow.swift
//  Io
//
//  Created by Carson Gross on 3/29/24.
//

import SwiftUI
import MusicKit

struct PlaylistRow: View {
    var playlist: Playlist
    
    var body: some View {
        MusicItemCell(
            artwork: playlist.artwork,
            title: playlist.name
        )
    }
}

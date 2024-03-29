//
//  PlaylistDetailView.swift
//  Io
//
//  Created by Carson Gross on 3/29/24.
//

import SwiftUI
import MusicKit

struct PlaylistDetailView: View {
    var playlist: Playlist
    
    @State private var detailedPlaylist: Playlist?
    
    var body: some View {
        SubscriptionOfferableView(itemID: playlist.id, messageIdentifier: .playMusic) {
            Group {
                if let detailedPlaylist {
                    List {
                        Section { } header: {
                            CollectionHeader(
                                artwork: detailedPlaylist.artwork,
                                title: detailedPlaylist.name,
                                ownerName: detailedPlaylist.curatorName,
                                description: detailedPlaylist.description,
                                itemCount: detailedPlaylist.tracks?.count
                            )
                        }
                    }
                } else {
                    Color.clear
                }
            }
        }
        .task { await getDetailedPlaylist() }
    }
    
    private func getDetailedPlaylist() async {
        do {
            detailedPlaylist = try await playlist.with([.tracks, .moreByCurator, .featuredArtists])
        } catch {
            print("❌ Error fetching detailed playlist: \(error.localizedDescription)")
        }
    }
}

//
//  MusicLibraryManager.swift
//  Io
//
//  Created by Carson Gross on 3/29/24.
//

import Foundation
import MusicKit

@Observable
final class MusicLibraryManager {
    static let shared = MusicLibraryManager()
    
    private init() { 
        fetchLibraryPlaylists()
    }
    
    var playlists = MusicItemCollection<Playlist>()
    
    func fetchLibraryPlaylists() {
        Task {
            do {
                let request = MusicLibraryRequest<Playlist>()
                let response = try await request.response()
                playlists = response.items
            } catch {
                print("Error fetching library playlists: \(error.localizedDescription)")
            }
        }
    }
}

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
    
    private init() { }
    
    var playlists = [Playlist]()
}

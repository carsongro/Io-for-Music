//
//  Navigator.swift
//  Io
//
//  Created by Carson Gross on 3/29/24.
//

import Foundation
import MusicKit

@Observable
final class Navigator {
    static let shared = Navigator()
    
    private init() { }
    
    var selectedScreen: AppScreen?
    var selectedPlaylist: Playlist?
    
    
}

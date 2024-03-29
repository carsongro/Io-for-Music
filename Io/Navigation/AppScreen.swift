//
//  AppScreen.swift
//  Io
//
//  Created by Carson Gross on 3/29/24.
//

import SwiftUI

enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {
    case home
    case search
    
    var id: AppScreen { self }
}

extension AppScreen {
    @ViewBuilder
    var label: some View {
        switch self {
        case .home:
            Label("Home", systemImage: "music.note.house.fill")
                .imageScale(.large)
        case .search:
            Label("Search", systemImage: "magnifyingglass")
                .imageScale(.large)
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            HomeNavigationStack()
        case .search:
            SearchNavigationStack()
        }
    }
}

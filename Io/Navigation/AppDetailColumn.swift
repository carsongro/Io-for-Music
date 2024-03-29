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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AppDetailColumn()
        .environment(Navigator.shared)
}

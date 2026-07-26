//
//  ApexHUDApp.swift
//  ApexHUD
//
//  Created by gaowanlu on 2026/7/19.
//

import SwiftUI

@main
struct ApexHUDApp: App {
    @AppStorage("app_color_scheme") private var selectedScheme: AppColorScheme = .system

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(selectedScheme.colorScheme)
        }
    }
}

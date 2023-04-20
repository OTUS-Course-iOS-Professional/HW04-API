//
//  OTUS_HW04_APIApp.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI

@main
struct OTUS_HW04_APIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Router())
                .environmentObject(NewsAPIViewModel())
        }
    }
}

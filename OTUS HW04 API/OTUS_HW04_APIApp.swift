//
//  OTUS_HW04_APIApp.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI

@main
struct OTUS_HW04_APIApp: App {
    private let token = "342e3cc3296f4435bb6d0eb353bfedf5"
    init() {
        ServiceLocator.shared.add(
            service: NewsAPIService(token: token)
        )
        ServiceLocator.shared.add(
            service: NewsTopicsService()
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//
//  ContentView.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.tabSelection) {
            NewsListScreen()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Новости")
                }
                .tag(0)
            
            AboutScreen()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("О приложении")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  NewsScreen.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 27.04.2023.
//

import SwiftUI

struct NewsScreen: View {
    @ObservedObject var news: NewsAPIViewModel = .init()
    @ObservedObject var topics: NewsTopicsViewModel = .init()

    var body: some View {
        NavControllerView {
            VStack  {
                Text("News")
                    .font(.title)
                TopicsView()
                    .environmentObject(topics)
                
                NewsListView()
                    .environmentObject(news)
            }
        }
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}

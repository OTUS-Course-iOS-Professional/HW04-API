//
//  NewsListScreen.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI

struct NewsListScreen: View {
    
    @EnvironmentObject var news: NewsAPIViewModel
    @State var topic: Int = 0
    
    var list: some View  {
        List(news.articles) { article  in
            NavPushButton(destination: ArticleDetailView(article: article)) {
                ArticleCellView(article: article)
                    .environmentObject(news)
            }
        }
    }
    
    var body: some View {
        NavControllerView {
            VStack  {
                Text("Новости")
                    .font(.largeTitle)
                Picker("Topic", selection: $topic) {
                    ForEach(0..<topics.count, id: \.self) {
                        Text(topics[$0].topic)
                            .tag($0)
                    }
                    .onChange(of: topic) {
                        news.setTopic(to: topics[$0].topic)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                if news.isPageLoading && news.articles.isEmpty {
                    ProgressView()
                        .scaleEffect(2.0)
                        .padding()
                }
                
                if news.lastError != "" {
                    Text(news.lastError)
                }
                
                list
            }
        }
    }
}

struct TopicChoice {
    var topic: String
}

let topics = [
    TopicChoice(topic: "Apple"),
    TopicChoice(topic: "Кулинария"),
    TopicChoice(topic: "Здоровье")
]

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen()
    }
}

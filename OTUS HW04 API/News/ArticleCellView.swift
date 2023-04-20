//
//  ArticleCellView.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI
import NewsAPI

struct ArticleCellView: View {
    
    @EnvironmentObject var news: NewsAPIViewModel
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title ?? "")
            
            if news.isPageLoading && news.articles.isLast(article) {
                Divider()
                HStack {
                    Spacer()
                    ProgressView()
                        .scaleEffect(2.0)
                        .padding()
                    Spacer()
                }
            }
        }
        .onAppear {
            if news.articles.isLast(article) {
                news.loadPage()
            }
        }
    }
}

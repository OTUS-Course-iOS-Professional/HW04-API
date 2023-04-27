//
//  NewsListView.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var news: NewsAPIViewModel
    
    var list: some View  {
        List(news.articles) { article  in
            NavPushButton(destination: ArticleDetailView(article: article)) {
                ArticleCellView(article: article)
                    .environmentObject(news)
            }
        }
    }
    
    var body: some View {
        VStack {
            if news.isPageLoading && news.articles.isEmpty {
                ProgressView()
                    .scaleEffect(2.0)
                    .padding()
            }
            
            if news.lastError != "" {
                Text(news.lastError)
                    .foregroundColor(.red)
            }
            
            if #available(iOS 15.0, *) {
                list
                    .refreshable {
                        await news.reload()
                    }
            } else {
                list
            }
        }
    }
}


struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

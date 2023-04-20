//
//  ArticleDetailView.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI
import NewsAPI

struct ArticleDetailView: View {
    
    @EnvironmentObject var navigationController: NavControllerViewModel
    var article: Article
    
    var body: some View {
        VStack {
            Text(article.title ?? "")
                .font(.title)
            Text(article.description ?? "")
                .padding(.vertical)
            
            Button(action: {
                    navigationController.push(
                        ArticleMetaData(article: article)
                    )
            }) {
                Text("Мета данные")
            }
            
            Button(action: {navigationController.pop()}) {
                Text("Назад")
            }.padding(.vertical)
            
            Spacer()
        }
        .padding()
    }
}

//
//  ArticleMetaData.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI
import NewsAPI

struct ArticleMetaData: View {
    
    @EnvironmentObject var navigationController: NavControllerViewModel
    var article: Article
    
    func tableRow(title: String, text: String?) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(text ?? "N/A")
        }
    }
    
    var body: some View {
        VStack {
            Text(article.title ?? "No title")
                .font(.title)
                .padding(.bottom)
            
            tableRow(title: "Автор", text: article.author)
            tableRow(title: "Опубликовано", text: article.publishedAt)
            
            Button(action: { navigationController.pop() }) {
                Text("Назад")
            }.padding(.vertical)
            
            Button(action: { navigationController.pop(to: .root) }) {
                Text("К новостям")
            }
            
            Spacer()
        }
        .padding()
    }
}

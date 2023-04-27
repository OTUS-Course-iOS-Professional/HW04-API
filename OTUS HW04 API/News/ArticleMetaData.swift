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
            HStack {
                Button(action: { navigationController.pop() }) {
                    Image(systemName: "arrow.backward")
                }
                .padding(.vertical)
                
                Spacer()
            }
            
            Text(article.title ?? "No title")
                .font(.title)
                .padding(.bottom)
            
            tableRow(title: "Author", text: article.author)
            tableRow(title: "Published at", text: article.publishedAt)
            
            Button(action: { navigationController.pop(to: .root) }) {
                Text("To the list")
            }
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
    }
}

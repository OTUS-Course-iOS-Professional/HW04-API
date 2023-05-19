//
//  NewsAPIViewModel.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import Foundation
import NewsAPI

struct ArticleQueryParams {
    var query: String
    var fromDate: Date?
    var toDate: Date?
    var sortBy: ArticleSort
    var language: String?
}

class NewsAPIViewModel: ObservableObject {
    static var newsApiToken = "342e3cc3296f4435bb6d0eb353bfedf5"
    
    private var userDefaults: UserDefaultsViewModel = .init()
    @Published private(set) var lastError: String = ""
    @Published private(set) var articles: [Article] = .init()
    @Published private(set) var isPageLoading: Bool = false
    private(set) var queryParams: ArticleQueryParams = .init(
        query: "WWDC",
        sortBy: ArticleSort.publishedat,
        language: "ru"
    ) {
        didSet {
            page = 0
            articles.removeAll()
            loadPage()
        }
    }
    private(set) var pageSize: Int = 10
    private(set) var page: Int = 0
    
    init() {
        loadPage()
    }
    
    func setTopic(to newTopic: String) {
        guard queryParams.query != newTopic else {
            return
        }
        queryParams.query = newTopic
    }
    
    func loadPage() {
        
        if let articles = userDefaults.getCachedArticles(params: queryParams) {
            self.articles = articles
            return
        }
        
        guard isPageLoading == false else {
            return
        }
        lastError = ""
        isPageLoading = true
        page += 1
        NewsAPI.everythingGet(q: queryParams.query,
                              sortBy: queryParams.sortBy,
                              apiKey: NewsAPIViewModel.newsApiToken,
                              from: queryParams.fromDate,
                              to: queryParams.toDate,
                              language: queryParams.language,
                              page: page,
                              pageSize: pageSize) { list, error in
            
            if let error = error {
                self.lastError = error.localizedDescription
                return
            }
            
            if list?.status != "ok" {
                self.lastError = "Ошибка загрузки данных"
                return
            }
            
            let displayArticles = list?.articles?.filter { article in
                article.title != nil
            } ?? []
            
            self.articles.append(contentsOf: displayArticles)
            self.isPageLoading = false
        }
    }
    
}


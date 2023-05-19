//
//  UserDefaultsViewModel.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 19.05.2023.
//

import SwiftUI
import NewsAPI

final class UserDefaultsViewModel: ObservableObject {
    private var defaults = UserDefaults.standard
    
    struct CachedData: Codable {
        let data: [Article]
    }
    
    private var articleDataForFile = [String: Any]()
    
    func cacheData(for articles: [Article], params: ArticleQueryParams) {
        guard let dataArticles = convertArticleToJSON(articles) else { return }
        defaults.set(dataArticles, forKey: getKey(params: params))
    }
    
    func getCachedArticles(params: ArticleQueryParams) -> [Article]? {
        guard let data = UserDefaults.standard.object(forKey: getKey(params: params)) as? Data else { return nil }
        do {
            let cached = try JSONDecoder().decode(CachedData.self, from: data)
            return cached.data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getKey(params: ArticleQueryParams) -> String {
        "articles_in_\(params.query)"
    }
    
    func convertArticleToJSON(_ articles: [Article]) -> Data? {
        do {
            let encodedData = try JSONEncoder().encode(CachedData(data: articles))
            return encodedData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

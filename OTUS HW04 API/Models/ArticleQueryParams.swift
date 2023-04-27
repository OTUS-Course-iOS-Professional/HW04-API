//
//  ArticleQueryParams.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 27.04.2023.
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

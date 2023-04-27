//
//  NewsTopicsService.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 27.04.2023.
//

import Foundation

class NewsTopicsService {
    @UserDefaultsEncoded(key: "topics")
    private var storedTopics: [String]?
    
    @UserDefaultsEncoded(key: "topicIndex")
    private var storedTopicIndex: Int?
    
    var topics: [String]? {
        didSet {
            storedTopics = topics
        }
    }
    
    @Published public var topicIndex: Int = -1 {
        didSet {
            storedTopicIndex = topicIndex
        }
    }
    
    init() {
        topics = storedTopics ?? []
        topicIndex = storedTopicIndex ?? -1
        if topicIndex == -1 && topics!.count > 0 {
            topicIndex = 0
        }
    }
}

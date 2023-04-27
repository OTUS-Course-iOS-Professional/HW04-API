//
//  NewsTopicsViewModel.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 27.04.2023.
//

import Foundation
import Combine

class NewsTopicsViewModel: ObservableObject {
    @Injected private var topicsService: NewsTopicsService
    
    @Published private(set) var topics: [String] = []
    @Published var topicIndex: Int = -1 {
        willSet {
            topicsService.topicIndex = newValue
        }
    }
    
    init() {
        topics = topicsService.topics ?? []
        topicIndex = topicsService.topicIndex
        
        if topics.count == 0 {
            addTopic(name: "Apple")
        }
    }
    
    func addTopic(name: String) {
        let index = topics.firstIndex(of: name)
        
        if index == nil {
            topics.append(name)
        }
        
        topicsService.topics = topics
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.topicIndex = index ?? self.topics.count - 1
        }
    }
    
    func removeTopic(name: String) {
        topics.removeAll { value in
            value == name
        }
        
        topicsService.topics = topics
        topicIndex = topics.count - 1
    }
}

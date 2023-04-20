//
//  MetaWeatherViewModel.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

//import Foundation
//import MetaweatherAPI
//
//class MetaWeatherViewModel: ObservableObject {
//    @Published var locations: [Location] = []
//    @Published var searchQuery: String = "" {
//        didSet {
//            if searchQuery.count > 1 {
//                searchLocation(query: searchQuery)
//            }
//        }
//    }
//    
//    func searchLocation(query: String) {
//        WeatherSearchAPI.weatherSearch(query: query) { locations, error in
//            self.locations = locations ?? []
//        }
//    }
//}

//
//  ServiceLocator.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 27.04.2023.
//

import Foundation

class ServiceLocator {
    static let shared = ServiceLocator()
    
    private var services: [String:Any] = .init()

    func add<T>(service: T) {
        let key = "\(T.self)"
        services[key] = service
    }

    func resolve<T>() -> T {
        guard let resolvedService: T = lookup() else {
            fatalError("Could not resolve \(T.self)")
        }
        return resolvedService
    }
    
    func lookup<T>() -> T? {
        let key = "\(T.self)"
        return services[key] as? T
    }
}

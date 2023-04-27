//
//  Injected.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 27.04.2023.
//

import Foundation

@propertyWrapper
struct Injected<Service> {
    private var service: Service
    
    public init(serviceLocator: ServiceLocator = .shared) {
        self.service = serviceLocator.resolve()
    }
    
    public var wrappedValue: Service {
        get { return service }
        mutating set { service = newValue }
    }
}

//
//  UserDefaultsEncoded.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 27.04.2023.
//

import Foundation

@propertyWrapper
struct UserDefaultsEncoded<Value:Codable> {
    private var value: Value?
    private var key: String
    private var storage: UserDefaults
    
    init(key: String, storage: UserDefaults = .standard) {
        self.storage = storage
        self.key = key
        
        self.value = nil
        if let savedValue = storage.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            self.value = try? decoder.decode(Value.self, from: savedValue)
        }
    }
    
    var wrappedValue: Value? {
        get {
            value
        }
        mutating set {
            value = newValue
            guard let value = value else {
                return
            }
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(value) {
                storage.set(encoded, forKey: key)
            }
        }
    }
}

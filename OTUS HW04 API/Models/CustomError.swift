//
//  CustomError.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 27.04.2023.
//

import Foundation

struct CustomError: Error, CustomStringConvertible {
    var description: String

    init(description: String) {
        self.description = description
    }
}

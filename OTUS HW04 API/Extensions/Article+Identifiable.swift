//
//  Article+Identifiable.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import Foundation
import NewsAPI

extension Article: Identifiable {
    public var id: String { return  url }
}

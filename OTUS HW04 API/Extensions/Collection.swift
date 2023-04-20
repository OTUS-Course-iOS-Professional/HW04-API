//
//  Collection.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    public func isLast<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else {
            return false
        }

        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }

        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
}

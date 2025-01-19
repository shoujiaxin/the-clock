//
//  Content.swift
//  SplitFlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/6.
//

import Foundation

struct Content: Hashable {
    let oldValue: String

    let newValue: String
}

extension Content: Identifiable {
    typealias ID = String

    var id: ID {
        oldValue + newValue
    }
}

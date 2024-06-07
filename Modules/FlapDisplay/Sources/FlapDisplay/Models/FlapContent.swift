//
//  FlapContent.swift
//  FlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/6.
//

import Foundation

struct FlapContent: Hashable {
    let oldValue: String

    let newValue: String
}

extension FlapContent: Identifiable {
    typealias ID = String

    var id: ID {
        oldValue + newValue
    }
}

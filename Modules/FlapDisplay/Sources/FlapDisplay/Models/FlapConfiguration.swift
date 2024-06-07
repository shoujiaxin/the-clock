//
//  FlapConfiguration.swift
//
//
//  Created by Jiaxin Shou on 2024/6/7.
//

import Foundation

struct FlapConfiguration {
    let frontContent: String

    let backContent: String

    let cornerRadius: CGFloat?

    let index: Double?

    init(
        frontContent: String,
        backContent: String,
        cornerRadius: CGFloat? = nil,
        index: Double? = nil
    ) {
        self.frontContent = frontContent
        self.backContent = backContent
        self.cornerRadius = cornerRadius
        self.index = index
    }

    init(_ content: String) {
        self.init(frontContent: content, backContent: content)
    }
}

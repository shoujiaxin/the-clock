//
//  FlapConfiguration.swift
//  FlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/7.
//

import Foundation

struct FlapConfiguration {
    let frontContent: String

    let backContent: String

    let cornerRadius: CGFloat?

    let theme: FlapTheme

    let index: Double?

    init(
        frontContent: String,
        backContent: String,
        cornerRadius: CGFloat? = nil,
        theme: FlapTheme = .dark,
        index: Double? = nil
    ) {
        self.frontContent = frontContent
        self.backContent = backContent
        self.cornerRadius = cornerRadius
        self.theme = theme
        self.index = index
    }

    init(
        _ content: String,
        cornerRadius: CGFloat? = nil,
        theme: FlapTheme = .dark,
        index: Double? = nil
    ) {
        self.init(
            frontContent: content,
            backContent: content,
            cornerRadius: cornerRadius,
            theme: theme,
            index: index
        )
    }
}

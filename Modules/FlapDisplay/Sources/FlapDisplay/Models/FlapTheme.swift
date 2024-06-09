//
//  FlapTheme.swift
//  FlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/9.
//

import SwiftUI

enum FlapTheme {
    case light

    case dark
}

extension FlapTheme {
    var foregroundColor: Color {
        switch self {
        case .light:
            .init(white: 0.2)
        case .dark:
            .init(white: 0.8)
        }
    }

    var backgroundColor: Color {
        switch self {
        case .light:
            .init(white: 0.9)
        case .dark:
            .init(white: 0.1)
        }
    }
}

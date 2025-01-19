//
//  Theme.swift
//  SplitFlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/9.
//

import SwiftUI

enum Theme {
    case light

    case dark
}

extension Theme {
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

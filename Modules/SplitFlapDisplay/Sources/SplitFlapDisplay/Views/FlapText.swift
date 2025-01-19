//
//  FlapText.swift
//  SplitFlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/7.
//

import SwiftUI

struct FlapText: View {
    private let content: String

    private let maximumFontSize: CGFloat

    private let minimumScaleFactor: CGFloat

    init(
        _ content: String,
        maximumFontSize: CGFloat = 500,
        minimumScaleFactor: CGFloat = 0.01
    ) {
        self.content = content
        self.maximumFontSize = maximumFontSize
        self.minimumScaleFactor = minimumScaleFactor
    }

    // MARK: - Views

    var body: some View {
        Text(content)
            .font(.system(size: maximumFontSize).bold())
            .minimumScaleFactor(minimumScaleFactor)
            .monospaced()
            .scaledToFit()
    }
}

#if DEBUG

#Preview {
    FlapText("A")
}

#endif

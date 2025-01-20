//
//  NixieTubeDisplay.swift
//  NixieTubeDisplay
//
//  Created by Jiaxin Shou on 2025/1/20.
//

import SwiftUI

public struct NixieTubeDisplay: View {
    private let content: String

    public init(_ content: String) {
        self.content = content
    }

    // MARK: - Views

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(content), id: \.self) { character in
                NixieTube(content: character)
            }
        }
    }
}

#if DEBUG

#Preview {
    NixieTubeDisplay(Date.now.formatted(.dateTime.hour().minute().second()))
}

#endif

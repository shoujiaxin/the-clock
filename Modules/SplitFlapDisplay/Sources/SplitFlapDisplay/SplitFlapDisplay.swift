//
//  SplitFlapDisplay.swift
//  SplitFlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/5.
//

import SwiftUI

public struct SplitFlapDisplay: View {
    private let content: String

    public init(_ content: String) {
        self.content = content
    }

    // MARK: - Private States

    @State
    private var flapContents: [Content] = []

    @State
    private var flippingCount: Int = 0

    // MARK: - Views

    public var body: some View {
        ZStack {
            Flap(configuration: .init(flapContents.last?.newValue ?? content))

            ForEach(flapContents.indices, id: \.self) { index in
                AnimatedFlap(
                    configuration: .init(
                        frontContent: flapContents[index].oldValue,
                        backContent: flapContents[index].newValue,
                        index: Double(index) / Double(flapContents.count)
                    )
                ) {
                    flippingCount -= 1
                    if flippingCount == 0 {
                        flapContents.removeAll()
                    }
                }
            }

            Flap(configuration: .init(flapContents.first?.oldValue ?? content))
                .flip(true)
        }
        .onChange(of: content) { oldValue, newValue in
            flapContents.append(.init(oldValue: oldValue, newValue: newValue))
            flippingCount += 1
        }
    }
}

#if DEBUG

#Preview {
    SplitFlapDisplay("1")
}

#endif

//
//  Flap.swift
//  SplitFlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/5.
//

import SwiftUI

struct Flap: View {
    let configuration: Configuration

    init(configuration: Configuration) {
        self.configuration = configuration
    }

    // MARK: - Private States

    private var rotation: Double = 0

    private var isFlipped: Bool {
        rotation < -90
    }

    private var zIndex: Double {
        if let index = configuration.index {
            isFlipped ? index : 1 - index
        } else {
            -1
        }
    }

    // MARK: - Views

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let cornerRadius = configuration.cornerRadius ?? min(size.width, size.height) * 0.1

            UnevenRoundedRectangle(
                topLeadingRadius: cornerRadius,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: cornerRadius
            )
            .foregroundStyle(configuration.theme.backgroundColor)
            .frame(width: size.width, height: size.height * 0.49)
            .overlay(alignment: .top) {
                FlapText(isFlipped ? configuration.backContent : configuration.frontContent)
                    .foregroundStyle(configuration.theme.foregroundColor)
                    .padding(min(size.width, size.height) * 0.05)
                    .frame(width: size.width, height: size.height)
                    .scaleEffect(y: isFlipped ? -1 : 1)
            }
            .clipped()
        }
        .zIndex(zIndex)
        .rotation3DEffect(
            .degrees(rotation),
            axis: (x: 1.0, y: 0.0, z: 0.0),
            perspective: 0.25
        )
    }
}

extension Flap: @preconcurrency Animatable {
    typealias AnimatableData = Double

    var animatableData: AnimatableData {
        get {
            rotation
        }
        set {
            rotation = newValue
        }
    }
}

extension Flap {
    func flip(_ flip: Bool) -> Self {
        var view = self
        view.rotation = flip ? -180 : 0
        return view
    }
}

#if DEBUG

#Preview {
    ZStack {
        Flap(configuration: .init("6"))

        Flap(configuration: .init("6"))
            .flip(true)
    }
}

#endif

//
//  Flap.swift
//  FlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/5.
//

import SwiftUI

struct Flap: View {
    let configuration: FlapConfiguration

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

    init(configuration: FlapConfiguration) {
        self.configuration = configuration
    }

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let cornerRadius = configuration.cornerRadius ?? min(size.width, size.height) / 10

            UnevenRoundedRectangle(
                topLeadingRadius: cornerRadius,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: cornerRadius
            )
            .frame(width: size.width, height: size.height / 2)
            .overlay(alignment: .top) {
                ScalableText(isFlipped ? configuration.backContent : configuration.frontContent)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
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

extension Flap: Animatable {
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

#Preview {
    ZStack {
        Flap(configuration: .init("6"))

        Flap(configuration: .init("6"))
            .flip(true)
    }
    .frame(width: 140, height: 220)
}

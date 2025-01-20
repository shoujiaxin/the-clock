//
//  AnimatedFlap.swift
//  SplitFlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/7.
//

import SwiftUI

struct AnimatedFlap: View {
    let configuration: Configuration

    let completion: () -> Void

    // MARK: - Private States

    @State
    private var flip: Bool = false

    // MARK: - Views

    var body: some View {
        Flap(configuration: configuration)
            .flip(flip)
            .onAppear {
                withAnimation(.interpolatingSpring(bounce: 0.25)) {
                    flip = true
                } completion: {
                    completion()
                }
            }
    }
}

#if DEBUG

#Preview {
    AnimatedFlap(configuration: .init("8")) {}
}

#endif

//
//  AnimatedFlap.swift
//  FlapDisplay
//
//  Created by Jiaxin Shou on 2024/6/7.
//

import SwiftUI

struct AnimatedFlap: View {
    let configuration: FlapConfiguration

    let completion: () -> Void

    @State
    private var flip: Bool = false

    var body: some View {
        Flap(configuration: configuration)
            .flip(flip)
            .onAppear {
                withAnimation(.easeIn) {
                    flip = true
                } completion: {
                    completion()
                }
            }
    }
}

#Preview {
    AnimatedFlap(configuration: .init("8")) {}
        .frame(width: 140, height: 220)
}

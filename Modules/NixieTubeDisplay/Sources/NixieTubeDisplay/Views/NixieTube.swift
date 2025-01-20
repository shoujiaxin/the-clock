//
//  NixieTube.swift
//  NixieTubeDisplay
//
//  Created by Jiaxin Shou on 2025/1/19.
//

import SwiftUI

struct NixieTube: View {
    let content: Character

    var maximumFontSize: CGFloat = 500

    var minimumScaleFactor: CGFloat = 0.01

    // MARK: - Private States

    private let characters: [Character] = [".", ":", "6", "7", "5", "8", "4", "3", "9", "2", "0", "1"]

    // MARK: - Views

    var body: some View {
        ZStack {
            ForEach(characters.reversed(), id: \.self) { character in
                let isActive = content == character

                nixieCharacter(character)
                    .fontWeight(isActive ? .thin : .ultraLight)
                    .foregroundStyle(.orange)
                    // TODO: Opacity based on distance.
                    .opacity(isActive ? 1 : 0.035)

                if isActive {
                    glowEffect
                        .transition(.opacity)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(4)
        }
        .blendMode(.plusLighter)
        .drawingGroup()
        .font(.system(size: maximumFontSize))
        .minimumScaleFactor(minimumScaleFactor)
        .scaledToFit()
    }

    private func nixieCharacter(_ character: Character) -> some View {
        Text(String(character))
            .scaledToFit()
    }

    private var glowEffect: some View {
        Group {
            nixieCharacter(content)
                .fontWeight(.thin)
                .foregroundStyle(.orange)
                .visualEffect { content, geometry in
                    content
                        .blur(radius: min(geometry.size.width, geometry.size.height) * 0.06)
                }

            nixieCharacter(content)
                .fontWeight(.thin)
                .foregroundStyle(.red)
                .visualEffect { content, geometry in
                    content
                        .blur(radius: min(geometry.size.width, geometry.size.height) * 0.06)
                        .opacity(0.5)
                }
        }
    }
}

#if DEBUG

#Preview {
    NixieTube(content: "6")
}

#endif

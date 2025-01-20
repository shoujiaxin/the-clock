//
//  NixieTube.swift
//  NixieTubeDisplay
//
//  Created by Jiaxin Shou on 2025/1/19.
//

import SwiftUI

private let characters: [Character] = [".", ":", "6", "7", "5", "8", "4", "3", "9", "2", "0", "1"]

struct NixieTube: View {
    let content: Character

    var maximumFontSize: CGFloat = 500

    var minimumScaleFactor: CGFloat = 0.01

    // MARK: - Views

    var body: some View {
        ZStack {
            ForEach(characters.reversed(), id: \.self) { character in
                Group {
                    if content == character {
                        activeCharacter(character)
                    } else {
                        inactiveCharacter(character)
                    }
                }
                .transition(.opacity)
            }
            .padding(4)
        }
        .blendMode(.plusLighter)
        .drawingGroup()
        .font(.system(size: maximumFontSize))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .minimumScaleFactor(minimumScaleFactor)
        .scaledToFit()
    }

    private func nixieCharacter(_ character: Character) -> some View {
        Text(String(character))
            .scaledToFit()
    }

    private func activeCharacter(_ character: Character) -> some View {
        ZStack {
            nixieCharacter(character)
                .fontWeight(.thin)
                .foregroundStyle(.orange)

            nixieCharacter(character)
                .fontWeight(.thin)
                .foregroundStyle(.orange)
                .visualEffect { content, geometry in
                    content
                        .blur(radius: min(geometry.size.width, geometry.size.height) * 0.08)
                }

            nixieCharacter(character)
                .fontWeight(.thin)
                .foregroundStyle(.red)
                .visualEffect { content, geometry in
                    content
                        .blur(radius: min(geometry.size.width, geometry.size.height) * 0.08)
                        .opacity(0.5)
                }
        }
    }

    private func inactiveCharacter(_ character: Character) -> some View {
        nixieCharacter(character)
            .fontWeight(.ultraLight)
            .foregroundStyle(.orange)
            // TODO: Opacity based on distance.
            .opacity(0.035)
    }
}

#if DEBUG

#Preview {
    NixieTube(content: "6")
}

#endif

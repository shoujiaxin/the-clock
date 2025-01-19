//
//  FlipClock.swift
//  TheClock
//
//  Created by Jiaxin Shou on 2025/1/19.
//

import SplitFlapDisplay
import SwiftUI

struct FlipClock: View {
    // MARK: - Private States

    @State
    private var date: Date = .now

    // MARK: - Views

    var body: some View {
        let dateStyle = Date.FormatStyle()

        GeometryReader { geometry in
            let size = geometry.size

            HStack(spacing: size.width * 0.05) {
                clockView(
                    date: date,
                    style: dateStyle.hour()
                )

                clockView(
                    date: date,
                    style: dateStyle.minute(.twoDigits)
                )

                clockView(
                    date: date,
                    style: dateStyle.second(.twoDigits)
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, size.width * 0.1)
            .padding(.vertical, size.height * 0.1)
        }
        .ignoresSafeArea()
        .onReceive(Timer.publish(every: 1, on: .current, in: .common).autoconnect()) { date in
            self.date = date
        }
    }

    @ViewBuilder
    private func clockView(date: Date, style: Date.FormatStyle) -> some View {
        let content = date.formatted(style).map(String.init)

        HStack {
            ForEach(content.indices, id: \.self) { index in
                SplitFlapDisplay(content[index])
                    .aspectRatio(0.618, contentMode: .fit)
            }
        }
    }
}

#if DEBUG

#Preview {
    FlipClock()
}

#endif

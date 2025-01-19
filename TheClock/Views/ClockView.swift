//
//  ClockView.swift
//  TheClock
//
//  Created by Jiaxin Shou on 2024/6/9.
//

import SplitFlapDisplay
import SwiftUI

struct ClockView: View {
    let date: Date

    let style: Date.FormatStyle

    init(_ date: Date, style: Date.FormatStyle) {
        self.date = date
        self.style = style
    }

    var body: some View {
        let content = date.formatted(style).map(String.init)

        HStack {
            ForEach(content.indices, id: \.self) { index in
                SplitFlapDisplay(content[index])
                    .aspectRatio(0.618, contentMode: .fit)
            }
        }
    }
}

#Preview {
    ClockView(.now, style: .init().hour())
}

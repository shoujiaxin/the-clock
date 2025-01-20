//
//  NixieTubeClock.swift
//  TheClock
//
//  Created by Jiaxin Shou on 2025/1/19.
//

import NixieTubeDisplay
import SwiftUI

struct NixieTubeClock: View {
    let date: Date

    @Environment(\.calendar)
    private var calendar

    // MARK: - Views

    var body: some View {
        ZStack {
            Color.black

            NixieTubeDisplay(date.formatted(.dateTime.hour().minute().second()))
                .animation(.default, value: date)
        }
        .ignoresSafeArea()
    }
}

#if DEBUG

#Preview {
    NixieTubeClock(date: .now)
}

#endif

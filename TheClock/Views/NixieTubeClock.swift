//
//  NixieTubeClock.swift
//  TheClock
//
//  Created by Jiaxin Shou on 2025/1/19.
//

import NixieTube
import SwiftUI

struct NixieTubeClock: View {
    let date: Date

    @Environment(\.calendar)
    private var calendar

    // MARK: - Views

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size

            HStack(spacing: size.width * 0.05) {
                let hour = calendar.component(.hour, from: date)
                let minute = calendar.component(.minute, from: date)
                let second = calendar.component(.second, from: date)
                NixieNumber(minute * 100 + second)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, size.width * 0.1)
            .padding(.vertical, size.height * 0.1)
        }
        .ignoresSafeArea()
        .background(Color.black)
        .font(.system(size: 80, weight: .thin, design: .rounded))
        .animation(.default, value: date)
    }
}

#if DEBUG

#Preview {
    NixieTubeClock(date: .now)
}

#endif

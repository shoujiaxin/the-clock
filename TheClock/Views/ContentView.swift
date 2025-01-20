//
//  ContentView.swift
//  TheClock
//
//  Created by Jiaxin Shou on 2025/1/19.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Private States

    @State
    private var date: Date = .now

    // MARK: - Views

    var body: some View {
        TabView {
            FlipClock(date: date)

            NixieTubeClock(date: date)
        }
//        .tabViewStyle(.page)
        .onReceive(Timer.publish(every: 1, on: .current, in: .common).autoconnect()) { date in
            self.date = date
        }
    }
}

#if DEBUG

#Preview {
    ContentView()
}

#endif

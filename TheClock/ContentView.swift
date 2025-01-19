//
//  ContentView.swift
//  TheClock
//
//  Created by Jiaxin Shou on 2024/5/19.
//

import SwiftUI

struct ContentView: View {
    @State
    private var date: Date = .now

    var body: some View {
        let dateStyle = Date.FormatStyle()

        GeometryReader { geometry in
            let size = geometry.size

            HStack(spacing: size.width * 0.05) {
                ClockView(date, style: dateStyle.hour())

                ClockView(date, style: dateStyle.minute(.twoDigits))

                ClockView(date, style: dateStyle.second(.twoDigits))
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
}

#Preview {
    ContentView()
}

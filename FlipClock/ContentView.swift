//
//  ContentView.swift
//  Flippy
//
//  Created by Jiaxin Shou on 2024/5/19.
//

import FlapDisplay
import SwiftUI

struct ContentView: View {
    @State
    private var date: Date = .now

    var body: some View {
        let dateStyle = Date.FormatStyle()

        HStack(spacing: 0) {
            ClockView(date, style: dateStyle.hour())

            Spacer(minLength: 20)

            ClockView(date, style: dateStyle.minute(.twoDigits))

            Spacer(minLength: 20)

            ClockView(date, style: dateStyle.second(.twoDigits))
        }
        .padding()
        .onReceive(Timer.publish(every: 1, on: .current, in: .common).autoconnect()) { date in
            self.date = date
        }
    }
}

#Preview {
    ContentView()
}

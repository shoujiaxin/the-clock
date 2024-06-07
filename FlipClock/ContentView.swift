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
    private var hour: [String] = []

    @State
    private var minute: [String] = []

    @State
    private var second: [String] = []

    var body: some View {
        HStack(spacing: 20) {
            HStack {
                ForEach(hour.indices, id: \.self) { index in
                    FlapDisplay(hour[index])
                        .aspectRatio(0.618, contentMode: .fit)
                }
            }

            HStack {
                ForEach(minute.indices, id: \.self) { index in
                    FlapDisplay(minute[index])
                        .aspectRatio(0.618, contentMode: .fit)
                }
            }

            HStack {
                ForEach(second.indices, id: \.self) { index in
                    FlapDisplay(second[index])
                        .aspectRatio(0.618, contentMode: .fit)
                }
            }
        }
        .padding()
        .onReceive(Timer.publish(every: 1, on: .current, in: .common).autoconnect()) { date in
            hour = date.formatted(Date.FormatStyle().hour()).map(String.init)
            minute = date.formatted(Date.FormatStyle().minute(.twoDigits)).map(String.init)
            second = date.formatted(Date.FormatStyle().second(.twoDigits)).map(String.init)
        }
    }
}

#Preview {
    ContentView()
}

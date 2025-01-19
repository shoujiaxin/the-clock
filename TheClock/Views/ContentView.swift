//
//  ContentView.swift
//  TheClock
//
//  Created by Jiaxin Shou on 2025/1/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FlipClock()
        }
        .tabViewStyle(.page)
    }
}

#if DEBUG

#Preview {
    ContentView()
}

#endif

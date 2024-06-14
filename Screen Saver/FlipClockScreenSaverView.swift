//
//  FlipClockScreenSaverView.swift
//  Screen Saver
//
//  Created by Jiaxin Shou on 2024/6/14.
//

import ScreenSaver

final class FlipClockScreenSaverView: ScreenSaverView {
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)

        animationTimeInterval = 1 / 30.0
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func animateOneFrame() {
        super.animateOneFrame()
    }
}

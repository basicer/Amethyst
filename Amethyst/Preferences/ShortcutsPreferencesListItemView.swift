//
//  ShortcutsPreferencesListItemView.swift
//  Amethyst
//
//  Created by Ian Ynda-Hummel on 5/15/16.
//  Copyright © 2016 Ian Ynda-Hummel. All rights reserved.
//

import Cartography
import Foundation
import MASShortcut

final class ShortcutsPreferencesListItemView: NSView {
    private(set) var nameLabel: NSTextField?
    private(set) var shortcutView: MASShortcutView?
    private(set) var shortcutView2: MASShortcutView?

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)

        let label = NSTextField()
        let shortcutView = MASShortcutView(frame: NSRect(x: 0, y: 0, width: 100, height: 19))
        let shortcutView2 = MASShortcutView(frame: NSRect(x: 0, y: 0, width: 100, height: 19))

        label.isBezeled = false
        label.isEditable = false
        label.stringValue = ""
        label.backgroundColor = NSColor.clear
        label.sizeToFit()

        addSubview(label)
        addSubview(shortcutView)
        addSubview(shortcutView2)

        constrain(label, shortcutView, shortcutView2, self) { label, shortcutView, shortcutView2, view in
            label.centerY == view.centerY
            label.left == view.left + 8

            shortcutView.centerY == view.centerY
            shortcutView.right == view.right - 8
            shortcutView.width == 100
            shortcutView.height == 19

            shortcutView2.centerY == view.centerY
            shortcutView2.right == view.right - (8 + 100 + 4)
            shortcutView2.width == 100
            shortcutView2.height == 19

        }

        self.nameLabel = label
        self.shortcutView = shortcutView
        self.shortcutView2 = shortcutView2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        shortcutView?.associatedUserDefaultsKey = nil
        shortcutView2?.associatedUserDefaultsKey = nil
    }
}

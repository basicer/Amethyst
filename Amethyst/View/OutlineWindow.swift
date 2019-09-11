//
//  LayoutNameWindow.swift
//  Amethyst
//
//  Created by Ian Ynda-Hummel on 5/15/16.
//  Copyright © 2016 Ian Ynda-Hummel. All rights reserved.
//

import Cocoa
import Foundation
import QuartzCore

final class OutlineWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: .borderless, backing: backingStoreType, defer: flag)

        isOpaque = false
        ignoresMouseEvents = true
        backgroundColor = NSColor.clear
        level = .popUpMenu
        collectionBehavior = .canJoinAllSpaces
        isReleasedWhenClosed = false
        setFrame(NSRect.zero, display: false)
        updateAlpha(sender: nil)
    }
    override func awakeFromNib() {
        //super.awakeFromNib()

    }

    @IBOutlet override var contentView: NSView? {
        didSet {
            contentView?.wantsLayer = true
            contentView?.layer?.frame = NSRectToCGRect(contentView!.frame)
            contentView?.layer?.cornerRadius = 10.0
            contentView?.layer?.masksToBounds = true
            contentView?.layer?.backgroundColor = NSColor.black.withAlphaComponent(0.0).cgColor
            contentView?.layer?.borderWidth = 5
            contentView?.layer?.borderColor = NSColor.blue.withAlphaComponent(0.5).cgColor
        }
    }

    func updateAlpha(sender: Any?) {
        alphaValue = 0.9
        self.orderFront(sender)
    }

    func outline<Window: WindowType>(window: Window) {
        let ow = self
        let oss = window.screen()
        let tf = window.frame()
        let spacing: CGFloat = 5.0

        if oss != nil {
            let os = oss!.frame
            ow.setFrame(NSRect(x: tf.minX - spacing, y: os.height - tf.minY - tf.height - spacing, width: tf.width + spacing*2, height: tf.height+spacing*2), display: true)
            ow.orderFrontRegardless()
            ow.contentView?.needsDisplay = true
            NSLog("DDDIDDD")
        }

    }
}

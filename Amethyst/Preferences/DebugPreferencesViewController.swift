//
//  DebugPreferencesViewController.swift
//  Amethyst
//
//  Created by Ian Ynda-Hummel on 3/9/19.
//  Copyright © 2019 Ian Ynda-Hummel. All rights reserved.
//

import AppKit
import Foundation

final class DebugPreferencesViewController: NSViewController {
    @IBOutlet var bundleText: NSTextField?
    @IBAction func selectAppForTerminal(sender: NSButton) {
        let openPanel = NSOpenPanel()
        let applicationDirectories = FileManager.default.urls(for: .applicationDirectory, in: .localDomainMask)

        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = false
        openPanel.allowsMultipleSelection = true
        openPanel.allowedFileTypes = ["app"]
        openPanel.prompt = "Select"
        openPanel.directoryURL = applicationDirectories.first

        guard case openPanel.runModal() = NSApplication.ModalResponse.OK else {
        return
        }

        for applicationURL in openPanel.urls {
            guard let applicationBundleIdentifier = Bundle(url: applicationURL)?.bundleIdentifier else {
            continue
            }

            UserConfiguration.shared.setTerminalBundle(bundle: applicationBundleIdentifier)
        }
    }

}

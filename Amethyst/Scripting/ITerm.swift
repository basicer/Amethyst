import Foundation
import ScriptingBridge

//swiftlint:disable identifier_name

// MARK: ITermSaveOptions
@objc public enum ITermSaveOptions: AEKeyword {
    case yes = 0x79657320 /* 'yes ' */
    case no = 0x6e6f2020 /* 'no  ' */
    case ask = 0x61736b20 /* 'ask ' */
}

// MARK: ITermGenericMethods
@objc public protocol ITermGenericMethods {
    @objc optional func delete() // Delete an object.
    @objc optional func duplicateTo(_ to: Any!, withProperties: Any!) // Copy object(s) and put the copies at a new location.
    @objc optional func exists() // Verify if an object exists.
    @objc optional func moveTo(_ to: Any!) // Move object(s) to a new location.
    @objc optional func close() // Close a document.
    @objc optional func createTabWithProfile(_ withProfile: Any!, command: Any!) -> ITermTab // Create a new tab
    @objc optional func createTabWithDefaultProfileCommand(_ command: Any!) -> ITermTab // Create a new tab with the default profile
    @objc optional func writeContentsOfFile(_ contentsOfFile: Any!, text: Any!, newline: Any!) // Send text as though it was typed.
    @objc optional func select() // Make receiver visible and selected.
    @objc optional func splitVerticallyWithProfile(_ withProfile: Any!, command: Any!) -> ITermSession // Split a session vertically.
    @objc optional func splitVerticallyWithDefaultProfileCommand(_ command: Any!) -> ITermSession // Split a session vertically, using the default profile for the new session
    @objc optional func splitVerticallyWithSameProfileCommand(_ command: Any!) -> ITermSession // Split a session vertically, using the original session's profile for the new session
    @objc optional func splitHorizontallyWithProfile(_ withProfile: Any!, command: Any!) -> ITermSession // Split a session horizontally.
    @objc optional func splitHorizontallyWithDefaultProfileCommand(_ command: Any!) -> ITermSession // Split a session horizontally, using the default profile for the new session
    @objc optional func splitHorizontallyWithSameProfileCommand(_ command: Any!) -> ITermSession // Split a session horizontally, using the original session's profile for the new session
    @objc optional func variableNamed(_ named: Any!) // Returns the value of a session variable with the given name
    @objc optional func setVariableNamed(_ named: Any!, to: Any!) // Sets the value of a session variable
    @objc optional func revealHotkeyWindow() // Reveals a hotkey window. Only to be called on windows that are hotkey windows.
    @objc optional func hideHotkeyWindow() // Hides a hotkey window. Only to be called on windows that are hotkey windows.
    @objc optional func toggleHotkeyWindow() // Toggles the visibility of a hotkey window. Only to be called on windows that are hotkey windows.
}

// MARK: ITermApplication
@objc public protocol ITermApplication: SBApplicationProtocol {
    @objc optional func windows()
    @objc optional var currentWindow: ITermWindow { get } // The frontmost window
    @objc optional var name: Int { get } // The name of the application.
    @objc optional var frontmost: Int { get } // Is this the frontmost (active) application?
    @objc optional var version: Int { get } // The version of the application.
    @objc optional func createWindowWithProfile(_ x: Any!, command: Any!) -> ITermWindow // Create a new window
    @objc optional func createHotkeyWindowWithProfile(_ x: Any!) -> ITermWindow // Create a hotkey window
    @objc optional func createWindowWithDefaultProfileCommand(_ command: Any!) -> ITermWindow // Create a new window with the default profile
    @objc optional func setCurrentWindow(_ currentWindow: ITermWindow!) // The frontmost window
}
extension SBApplication: ITermApplication {}

// MARK: ITermWindow
@objc public protocol ITermWindow: SBObjectProtocol, ITermGenericMethods {
    @objc optional func tabs()
    @objc optional func id() // The unique identifier of the session.
    @objc optional var alternateIdentifier: Int { get } // The alternate unique identifier of the session.
    @objc optional var name: Int { get } // The full title of the window.
    @objc optional var index: Int { get } // The index of the window, ordered front to back.
    @objc optional var bounds: Int { get } // The bounding rectangle of the window.
    @objc optional var closeable: Int { get } // Whether the window has a close box.
    @objc optional var miniaturizable: Int { get } // Whether the window can be minimized.
    @objc optional var miniaturized: Int { get } // Whether the window is currently minimized.
    @objc optional var resizable: Int { get } // Whether the window can be resized.
    @objc optional var visible: Int { get } // Whether the window is currently visible.
    @objc optional var zoomable: Int { get } // Whether the window can be zoomed.
    @objc optional var zoomed: Int { get } // Whether the window is currently zoomed.
    @objc optional var frontmost: Int { get } // Whether the window is currently the frontmost window.
    @objc optional var currentTab: ITermTab { get } // The currently selected tab
    @objc optional var currentSession: ITermSession { get } // The current session in a window
    @objc optional var isHotkeyWindow: Int { get } // Whether the window is a hotkey window.
    @objc optional var hotkeyWindowProfile: Int { get } // If the window is a hotkey window, this gives the name of the profile that created the window.
    @objc optional var position: Int { get } // The position of the window, relative to the upper left corner of the screen.
    @objc optional var origin: Int { get } // The position of the window, relative to the lower left corner of the screen.
    @objc optional var size: Int { get } // The width and height of the window
    @objc optional var frame: Int { get } // The bounding rectangle, relative to the lower left corner of the screen.
    @objc optional func setIndex(_ index: Int) // The index of the window, ordered front to back.
    @objc optional func setBounds(_ bounds: Int) // The bounding rectangle of the window.
    @objc optional func setMiniaturized(_ miniaturized: Int) // Whether the window is currently minimized.
    @objc optional func setVisible(_ visible: Int) // Whether the window is currently visible.
    @objc optional func setZoomed(_ zoomed: Int) // Whether the window is currently zoomed.
    @objc optional func setFrontmost(_ frontmost: Int) // Whether the window is currently the frontmost window.
    @objc optional func setCurrentTab(_ currentTab: ITermTab!) // The currently selected tab
    @objc optional func setCurrentSession(_ currentSession: ITermSession!) // The current session in a window
    @objc optional func setIsHotkeyWindow(_ isHotkeyWindow: Int) // Whether the window is a hotkey window.
    @objc optional func setHotkeyWindowProfile(_ hotkeyWindowProfile: Int) // If the window is a hotkey window, this gives the name of the profile that created the window.
    @objc optional func setPosition(_ position: Int) // The position of the window, relative to the upper left corner of the screen.
    @objc optional func setOrigin(_ origin: Int) // The position of the window, relative to the lower left corner of the screen.
    @objc optional func setSize(_ size: Int) // The width and height of the window
    @objc optional func setFrame(_ frame: Int) // The bounding rectangle, relative to the lower left corner of the screen.
}
extension SBObject: ITermWindow {}

// MARK: ITermTab
@objc public protocol ITermTab: SBObjectProtocol, ITermGenericMethods {
    @objc optional func sessions()
    @objc optional var currentSession: ITermSession { get } // The current session in a tab
    @objc optional var index: Int { get } // Index of tab in parent tab view control
    @objc optional func setCurrentSession(_ currentSession: ITermSession!) // The current session in a tab
    @objc optional func setIndex(_ index: Int) // Index of tab in parent tab view control
}
extension SBObject: ITermTab {}

// MARK: ITermSession
@objc public protocol ITermSession: SBObjectProtocol, ITermGenericMethods {
    @objc optional func id() // The unique identifier of the session.
    @objc optional var isProcessing: Int { get } // The session has received output recently.
    @objc optional var isAtShellPrompt: Int { get } // The terminal is at the shell prompt. Requires shell integration.
    @objc optional var columns: Int { get }
    @objc optional var rows: Int { get }
    @objc optional var tty: Int { get }
    @objc optional var contents: Int { get } // The currently visible contents of the session.
    @objc optional var text: Int { get } // The currently visible contents of the session.
    @objc optional var colorPreset: Int { get }
    @objc optional var backgroundColor: Int { get }
    @objc optional var boldColor: Int { get }
    @objc optional var cursorColor: Int { get }
    @objc optional var cursorTextColor: Int { get }
    @objc optional var foregroundColor: Int { get }
    @objc optional var selectedTextColor: Int { get }
    @objc optional var selectionColor: Int { get }
    @objc optional var ANSIBlackColor: Int { get }
    @objc optional var ANSIRedColor: Int { get }
    @objc optional var ANSIGreenColor: Int { get }
    @objc optional var ANSIYellowColor: Int { get }
    @objc optional var ANSIBlueColor: Int { get }
    @objc optional var ANSIMagentaColor: Int { get }
    @objc optional var ANSICyanColor: Int { get }
    @objc optional var ANSIWhiteColor: Int { get }
    @objc optional var ANSIBrightBlackColor: Int { get }
    @objc optional var ANSIBrightRedColor: Int { get }
    @objc optional var ANSIBrightGreenColor: Int { get }
    @objc optional var ANSIBrightYellowColor: Int { get }
    @objc optional var ANSIBrightBlueColor: Int { get }
    @objc optional var ANSIBrightMagentaColor: Int { get }
    @objc optional var ANSIBrightCyanColor: Int { get }
    @objc optional var ANSIBrightWhiteColor: Int { get }
    @objc optional var underlineColor: Int { get }
    @objc optional var useUnderlineColor: Int { get } // Whether the use a dedicated color for underlining.
    @objc optional var backgroundImage: Int { get }
    @objc optional var name: Int { get }
    @objc optional var transparency: Double { get }
    @objc optional var uniqueID: Int { get }
    @objc optional var profileName: Int { get } // The session's profile name
    @objc optional var answerbackString: Int { get } // ENQ Answerback string
    @objc optional func setIsProcessing(_ isProcessing: Int) // The session has received output recently.
    @objc optional func setIsAtShellPrompt(_ isAtShellPrompt: Int) // The terminal is at the shell prompt. Requires shell integration.
    @objc optional func setColumns(_ columns: Int)
    @objc optional func setRows(_ rows: Int)
    @objc optional func setContents(_ contents: Int) // The currently visible contents of the session.
    @objc optional func setColorPreset(_ colorPreset: Int)
    @objc optional func setBackgroundColor(_ backgroundColor: Int)
    @objc optional func setBoldColor(_ boldColor: Int)
    @objc optional func setCursorColor(_ cursorColor: Int)
    @objc optional func setCursorTextColor(_ cursorTextColor: Int)
    @objc optional func setForegroundColor(_ foregroundColor: Int)
    @objc optional func setSelectedTextColor(_ selectedTextColor: Int)
    @objc optional func setSelectionColor(_ selectionColor: Int)
    @objc optional func setANSIBlackColor(_ ANSIBlackColor: Int)
    @objc optional func setANSIRedColor(_ ANSIRedColor: Int)
    @objc optional func setANSIGreenColor(_ ANSIGreenColor: Int)
    @objc optional func setANSIYellowColor(_ ANSIYellowColor: Int)
    @objc optional func setANSIBlueColor(_ ANSIBlueColor: Int)
    @objc optional func setANSIMagentaColor(_ ANSIMagentaColor: Int)
    @objc optional func setANSICyanColor(_ ANSICyanColor: Int)
    @objc optional func setANSIWhiteColor(_ ANSIWhiteColor: Int)
    @objc optional func setANSIBrightBlackColor(_ ANSIBrightBlackColor: Int)
    @objc optional func setANSIBrightRedColor(_ ANSIBrightRedColor: Int)
    @objc optional func setANSIBrightGreenColor(_ ANSIBrightGreenColor: Int)
    @objc optional func setANSIBrightYellowColor(_ ANSIBrightYellowColor: Int)
    @objc optional func setANSIBrightBlueColor(_ ANSIBrightBlueColor: Int)
    @objc optional func setANSIBrightMagentaColor(_ ANSIBrightMagentaColor: Int)
    @objc optional func setANSIBrightCyanColor(_ ANSIBrightCyanColor: Int)
    @objc optional func setANSIBrightWhiteColor(_ ANSIBrightWhiteColor: Int)
    @objc optional func setUnderlineColor(_ underlineColor: Int)
    @objc optional func setUseUnderlineColor(_ useUnderlineColor: Int) // Whether the use a dedicated color for underlining.
    @objc optional func setBackgroundImage(_ backgroundImage: Int)
    @objc optional func setName(_ name: Int)
    @objc optional func setTransparency(_ transparency: Double)
    @objc optional func setAnswerbackString(_ answerbackString: Int) // ENQ Answerback string
}
extension SBObject: ITermSession {}

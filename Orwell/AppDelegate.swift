//
//  AppDelegate.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 13/04/21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var statusbar: NSStatusBar!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.closable, .resizable],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = true
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.level = .floating
        window.backgroundColor = .clear
        window.isMovable = true
        window.isMovableByWindowBackground = true
        
//        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
//        statusBarItem.menu = makeMenu()
//                
//        if let button = self.statusBarItem.button {
//            button.title = "Watch Me, Orwell"
//        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


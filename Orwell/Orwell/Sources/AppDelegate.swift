//
//  AppDelegate.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 14/04/21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var statusBarItem: NSStatusItem!
    let settings = UserSettings()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(settings)

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
        
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        statusBarItem.menu = makeMenu()
                
        if let button = self.statusBarItem.button {
            button.title = "Orwell"
//            button.action = #selector(makeRectangleCamera(:))
        }
    }
    
    @objc func makeRectangleCamera() {
        settings.shape = .rectangle
    }
    
    @objc func makeCircleCamera() {
        settings.shape = .circle
    }
    
    @objc func mirrorCamera() {
        settings.isMirroring.toggle()
    }
    
    private func makeMenu() -> NSMenu {
        //To Do
        var menu = NSMenu()
        
        return menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


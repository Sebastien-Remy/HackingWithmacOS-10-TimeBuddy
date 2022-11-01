//
//  AppDelegate.swift
//  TimeBuddy
//
//  Created by Sebastien REMY on 01/11/2022.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {
    
    var statusItem: NSStatusItem?
    var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Hello, world!")
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.title = "Time Buddy"
        statusItem?.menu = NSMenu()
        statusItem?.menu?.delegate = self
        
        
        let contentView = ContentView()
        popover.contentSize = CGSize(width: 500, height: 400)
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown, .rightMouseDown]) {
            [weak self] event in
            self?.popover.performClose(event)
        }
    }
    
    func menuWillOpen(_ menu: NSMenu) {
        addMenuItems()
        popover.performClose(self)
    }
    
    @objc func ShowSettings() {
        guard let statusBarButton = statusItem?.button else { return }
        popover.show(relativeTo: statusBarButton.bounds,
                     of: statusBarButton,
                     preferredEdge: .maxY)
    }
    
    func addMenuItems() {
        statusItem?.menu?.removeAllItems()
        statusItem?.menu?.addItem(withTitle: "Settings",
                                  action: #selector(ShowSettings),
                                  keyEquivalent: "")
    }
}

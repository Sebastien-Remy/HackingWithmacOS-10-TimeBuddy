//
//  AppDelegate.swift
//  TimeBuddy
//
//  Created by Sebastien REMY on 01/11/2022.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem?
    var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Hello, world!")
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.title = "Time Buddy"
        
    }
    
    
}

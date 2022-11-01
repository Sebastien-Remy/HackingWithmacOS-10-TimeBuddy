//
//  TimeBuddyApp.swift
//  TimeBuddy
//
//  Created by Sebastien REMY on 01/11/2022.
//

import SwiftUI

@main
struct TimeBuddyApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings { }
    }
}

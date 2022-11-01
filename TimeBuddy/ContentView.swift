//
//  ContentView.swift
//  TimeBuddy
//
//  Created by Sebastien REMY on 01/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timeZones = [String]()
    @State private var newTimeZone = "GMT"
    
    var body: some View {
        VStack {
            if timeZones.isEmpty {
                Text("Please add your first time zone bellow")
                    .frame(maxHeight: .infinity)
            } else {
                List {
                    ForEach(timeZones, id: \.self) { timeZone in
                        Text(timeZone)
                    }
                }
            }
            HStack {
                Picker("Add Time Zone", selection: $newTimeZone) {
//                    ForEach(TimeZone.knownTimeZoneIdentifiers, id:\.self) { timeZone in
//                        Text(timeZone)
//                    }
                    // More concise code
                    ForEach(TimeZone.knownTimeZoneIdentifiers, id:\.self, content: Text.init)
                }
                Button("Add") {
                if timeZones.contains(newTimeZone) == false {
                    withAnimation {
                        timeZones.append(newTimeZone)
            
                    }
                    
                }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

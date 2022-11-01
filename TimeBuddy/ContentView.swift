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
    @State private var selectedTimeZones = Set<String>()
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            if timeZones.isEmpty {
                Text("Please add your first time zone bellow")
                    .frame(maxHeight: .infinity)
            } else {
                List (selection: $selectedTimeZones) {
                    ForEach(timeZones, id: \.self) { timeZone in
                        Text("\((TimeZone(identifier:timeZone) != nil) ? (TimeZone(identifier:timeZone)!.formattedName) : "Unknow").")
                                .tag(timeZone)
                                .contextMenu {
                                    Button("Remove", role: .destructive) {
                                        deleteItems()
                                    }
                                }
                    }
                    .onMove(perform: moveItems)
                }
                .onDeleteCommand(perform: deleteItems)
                
            }
            HStack {
                Picker("Add Time Zone", selection: $newTimeZone) {
                    ForEach(TimeZone.knownTimeZoneIdentifiers, id:\.self) { timeZone in
                        if (TimeZone(identifier:timeZone) != nil) {
                            Text("\(TimeZone(identifier:timeZone)!.formattedName).")
                        } else {
                            Text(timeZone)
                        }
                    }
                }
                Button("Add") {
                    if timeZones.contains(newTimeZone) == false {
                        withAnimation {
                            timeZones.append(newTimeZone)
                        }
                        save()
                    } else {
                        showingAlert = true
                    }
                }
            }
            .padding()
            .onAppear(perform: load)
            .alert("You already add \(newTimeZone) in your buddy list !", isPresented: $showingAlert) {
                Button("Ok") {showingAlert = false }
            }
        }
    }
    
    func load() {
        timeZones = UserDefaults.standard.stringArray(forKey: "TimeZones") ?? []
    }
    
    func save() {
        UserDefaults.standard.set(timeZones, forKey: "TimeZones")
    }
    
    func deleteItems() {
        withAnimation {
            timeZones.removeAll(where: selectedTimeZones.contains)
        }
        save()
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        timeZones.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

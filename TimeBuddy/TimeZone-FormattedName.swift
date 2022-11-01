//
//  TimeZone-FormattedName.swift
//  TimeBuddy
//
//  Created by Sebastien REMY on 01/11/2022.
//

import Foundation

extension TimeZone {
    var formattedName: String {
        let start = localizedName(for: .generic, locale: .current) ?? "Unknow"
        return "\(start) - \(identifier)"
    }
}

//
//  DateFormatter.swift
//  StarWars
//
//  Created by Devashree KS on 23/01/22.
//

import Foundation


extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let trimmedIsoString = self.replacingOccurrences(of: "\\.\\d+", with: "", options: .regularExpression)
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: trimmedIsoString)
        return date
    }
    
    
    var percetageString: String {
        "\(self) (%)"
    }
    
    
    var hoursString: String {
        "\(self) (HOURS)"
    }
    
    
    var daysString: String {
        "\(self) (DAYS)"
    }
    
    
    var gravityString: String {
        "\(self) (G)"
    }
    
    
    var diameterString: String {
        "\(self) (KM)"
    }
    
}

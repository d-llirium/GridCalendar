//
//  ContentView.swift
//  GridCalendar
//
//  Created by User on 28/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    struct Day: Identifiable { // Identifiable protocol requires that it has an id value that is unique
        let id = UUID() // UUID structure is built into Foundation and guaranteed to be a unique value to use ForEach structure
        let value: Int // store the order of each particular day of the month
    }
    struct Month {
        let name: String
        let numberOfDays: Int
        var days: [Day]
        
        init(name: String, numberOfDays: Int) {
            self.name = name
            self.numberOfDays = numberOfDays
            self.days = []
            
            for n in 1...numberOfDays {
                self.days.append(Day(value: n))
            }
        }
    }
    let year = [
            Month(name: "January", numberOfDays: 31),
            Month(name: "February", numberOfDays: 28),
            Month(name: "March", numberOfDays: 31),
            Month(name: "April", numberOfDays: 30),
            Month(name: "May", numberOfDays: 31),
            Month(name: "June", numberOfDays: 30),
            Month(name: "July", numberOfDays: 31),
            Month(name: "August", numberOfDays: 31),
            Month(name: "September", numberOfDays: 30),
            Month(name: "October", numberOfDays: 31),
            Month(name: "November", numberOfDays: 30),
            Month(name: "December", numberOfDays: 31),
        ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  GridCalendar
//
//  Created by User on 28/08/23.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        // MARK: - GridItem
        GridItem(.flexible(minimum: 40)), // create a single fixed column of width 40, when used as input for a LazyVGrid = Vertical || create a single fixed row of height 40, when used as input for a LazyHGrid = Horizontal
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40))
        // .fixed() creates a colum with fixed width
        // .flexible(minimum: ) reates a column that takes up the available width it has
        //  .adaptive(minimum: ) fits multiple columns inside the width of a single GridItem
        ]
    var body: some View {
        // MARK: - LazyVGrid
        //Similar to the concept of lazy properties, the Lazy in LazyVGrid and LazyHGrid refers to the fact that the elements of the grid aren’t created until they are needed to display in the view
        ScrollView {
            LazyVGrid(columns: layout) { // layout constant as an argument to define the columns for our LazyVGrid structure
                ForEach(year, id: \.name){ month in
                    Section(header: Text(verbatim: month.name).font(.headline)) { // Section view that gives us a header view that we can use to display the name of the month
                        ForEach(month.days) { day in
                            Capsule() // create a Capsule with overlay text content that displays a string equal to the value property of the Day
                                .overlay(Text( "\(day.value)").foregroundColor(.white) )
                                .foregroundColor(.blue)
                                .frame(height: 40)
                        }
                    }
                }
            }
        }
    }
    struct Day: Identifiable { // Identifiable protocol requires that it has an id value that is unique
        let id = UUID() // UUID structure is built into Foundation and guaranteed to be a unique value to use ForEach structure
        let value: Int // store the order of each particular day of the month
    }
    struct Month { // we don’t have the same name of the month in our year, we can use it as the unique id
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

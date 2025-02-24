//
//  BirthDateView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct BirthDateView: View {
    @ObservedObject var userData: UserData
    
    let currentYear = Calendar.current.component(.year, from: Date())
    @State private var selectedMonth = Calendar.current.component(.month, from: Date()) - 1
    @State private var selectedDay = Calendar.current.component(.day, from: Date()) - 1
    @State private var selectedYear = Calendar.current.component(.year, from: Date()) - 25
    
    let months = Calendar.current.monthSymbols
    
    var daysInSelectedMonth: Int {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: selectedYear, month: selectedMonth + 1)
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    var body: some View {
        VStack {
            Text("When were you born?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("This will be used to calibrate your custom plan.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack {
                // Month Picker
                Picker("Month", selection: $selectedMonth) {
                    ForEach(0..<months.count, id: \.self) { index in
                        Text(months[index]).tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: UIScreen.main.bounds.width / 3)
                .clipped()
                .onChange(of: selectedMonth) { _, newMonth in
                    // Adjust selected day if it exceeds the number of days in the new month
                    if selectedDay >= daysInSelectedMonth {
                        selectedDay = daysInSelectedMonth - 1
                    }
                    updateBirthDate()
                }
                
                // Day Picker
                Picker("Day", selection: $selectedDay) {
                    ForEach(0..<daysInSelectedMonth, id: \.self) { day in
                        Text("\(day + 1)").tag(day)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: UIScreen.main.bounds.width / 3)
                .clipped()
                .onChange(of: selectedDay) { _, _ in
                    updateBirthDate()
                }
                
                // Year Picker
                Picker("Year", selection: $selectedYear) {
                    ForEach((1900...currentYear).reversed(), id: \.self) { year in
                        Text("\(year)").tag(year)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: UIScreen.main.bounds.width / 3)
                .clipped()
                .onChange(of: selectedYear) { _, newYear in
                    // Adjust selected day for leap years
                    if selectedDay >= daysInSelectedMonth {
                        selectedDay = daysInSelectedMonth - 1
                    }
                    updateBirthDate()
                }
            }
            .padding()
        }
    }
    
    private func updateBirthDate() {
        let components = DateComponents(
            year: selectedYear,
            month: selectedMonth + 1,
            day: selectedDay + 1
        )
        if let date = Calendar.current.date(from: components) {
            userData.birthDate = date
        }
    }
}

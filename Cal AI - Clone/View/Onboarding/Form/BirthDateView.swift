//
//  BirthDateView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI

struct BirthDateView: View {
    @ObservedObject var userData: UserData
    @State private var isViewVisible = false
    
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
        VStack(alignment: .leading) {
            // Title and Description
            VStack(alignment: .leading, spacing: 8) {
                Text("birth_date".localized)
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Text("description".localized)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            
            Spacer()
            
            // Horizontal Pickers
            HStack(spacing: 16) {
                // Month Picker
                VStack {
                    Text("month".localized)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Picker("month".localized, selection: $selectedMonth) {
                        ForEach(0..<months.count, id: \.self) { index in
                            Text(months[index])
                                .tag(index)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 150)
                    .clipped()
                    .onChange(of: selectedMonth) { _, newMonth in
                        // Adjust selected day if it exceeds the number of days in the new month
                        if selectedDay >= daysInSelectedMonth {
                            selectedDay = daysInSelectedMonth - 1
                        }
                        updateBirthDate()
                    }
                }
                .frame(maxWidth: .infinity)
                
                // Day Picker
                VStack {
                    Text("day".localized)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Picker("day".localized, selection: $selectedDay) {
                        ForEach(0..<daysInSelectedMonth, id: \.self) { day in
                            Text("\(day + 1)").tag(day)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 150)
                    .clipped()
                    .onChange(of: selectedDay) { _, _ in
                        updateBirthDate()
                    }
                }
                .frame(maxWidth: .infinity)
                
                // Year Picker
                VStack {
                    Text("year".localized)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Picker("year".localized, selection: $selectedYear) {
                        ForEach((1900...currentYear).reversed(), id: \.self) { year in
                            Text("\(year)").tag(year)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 150)
                    .clipped()
                    .onChange(of: selectedYear) { _, newYear in
                        // Adjust selected day for leap years
                        if selectedDay >= daysInSelectedMonth {
                            selectedDay = daysInSelectedMonth - 1
                        }
                        updateBirthDate()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .opacity(isViewVisible ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: isViewVisible)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .onAppear {
            // Trigger animations
            isViewVisible = true
            
        }
        .onDisappear {
            // Reset states
            isViewVisible = false
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
#Preview {
    BirthDateView(userData: UserData())
}

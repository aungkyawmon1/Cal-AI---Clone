//
//  RulerView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/23/2568.
//

import SwiftUI

struct RulerView: View {
    @Binding var selectedValue: Double
    let range: ClosedRange<Double>
    
    // Constants
    private let majorTickInterval: Double = 10
    private let tickWidth: CGFloat = 40
    private let tickHeight: CGFloat = 30
    private let visibleTicksCount = 15 // Number of ticks visible at once
    
    @State private var offset: CGFloat = 0
    @State private var lastOffset: CGFloat = 0
    @State private var isDragging = false
    
    // Computed properties
    private var totalRange: Double { range.upperBound - range.lowerBound }
    
    var body: some View {
        VStack(spacing: 0) {
            // Selected Value Display
            Text("\(Int(selectedValue)) lbs")
                .font(.system(size: 34, weight: .bold))
                .padding(.bottom, 20)
            
            // Ruler
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    // Center Line Indicator
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 2, height: tickHeight + 20)
                        .overlay(
                            Triangle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                                .offset(y: -5)
                        )
                        .zIndex(1)
                    
                    // Visible Ticks
                    HStack(spacing: 0) {
                        ForEach(visibleIndices, id: \.self) { index in
                            tickView(for: index)
                        }
                    }
                    .offset(x: offset + geometry.size.width / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                isDragging = true
                                let newOffset = lastOffset + value.translation.width
                                updateOffset(newOffset)
                            }
                            .onEnded { value in
                                isDragging = false
                                lastOffset = offset
                                snapToNearestTick()
                            }
                    )
                }
            }
            .frame(height: tickHeight + 40)
            .clipped()
        }
    }
    
    // Only generate indices for visible ticks
    private var visibleIndices: Range<Int> {
        let currentIndex = Int(-offset / tickWidth)
        let start = max(0, currentIndex - visibleTicksCount/2)
        let end = min(Int(totalRange), currentIndex + visibleTicksCount/2)
        return start..<end
    }
    
    private func tickView(for index: Int) -> some View {
        let value = range.lowerBound + Double(index)
        let isMajorTick = Int(value) % Int(majorTickInterval) == 0
        
        return VStack(spacing: 4) {
            Rectangle()
                .fill(isMajorTick ? Color.black : Color.gray)
                .frame(width: 1, height: isMajorTick ? tickHeight : tickHeight/2)
            
            if isMajorTick {
                Text("\(Int(value))")
                    .font(.caption)
                    .frame(width: 40)
            }
        }
        .frame(width: tickWidth)
    }
    
    private func updateOffset(_ newOffset: CGFloat) {
        let maxOffset = CGFloat(0)
        let minOffset = -CGFloat(totalRange) * tickWidth
        offset = min(maxOffset, max(minOffset, newOffset))
        
        // Update selected value
        let selectedIndex = -Int(round(offset / tickWidth))
        selectedValue = range.lowerBound + Double(selectedIndex)
    }
    
    private func snapToNearestTick() {
        let nearestTick = round(offset / tickWidth) * tickWidth
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            offset = nearestTick
            updateOffset(nearestTick)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}



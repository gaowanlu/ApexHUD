//
//  AltitudeHUDView.swift
//  ApexHUD
//
//  Created by gaowanlu on 2026/7/19.
//


//
//  AltitudeHUDView.swift
//  MeetXCode
//
//  Created by gaowanlu on 2026/7/19.
//

import SwiftUI

struct AltitudeHUDView: View {
    let state: ComparisonState
    let altitude: Double
    
    @State private var isFloating = false
    
    var body: some View {
        VStack(spacing: 15) {
            // 动态图标
            Image(systemName: state.iconName)
                .font(.system(size: 60))
                .foregroundColor(state == .airplane ? .blue : .green)
                .symbolEffect(.pulse, options: .repeating) // iOS 17+ 特效，如果报错请删除此行
                .rotationEffect(Angle(degrees: isFloating ? -5 : 5))
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)
            
            Text("\(altitude, specifier: "%.1f") M")
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
            
            Text(state.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(5)
                .background(Color.black.opacity(0.5))
                .cornerRadius(5)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color.black.opacity(0.3))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
        .onAppear { isFloating = true }
    }
}
